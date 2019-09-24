get '/my_plants' do 
    redirect '/login' unless logged_in?
    user_todos = Todo.where(user_id: current_user.id)
    plantsarr = user_todos.map {|todo| todo.plant_id }
    plants_id_arr = plantsarr.uniq
    plants_array = plants_id_arr.map {|plant| Plant.where(id: plant)}
    @plants = plants_array.flatten(1)
    add_plants_list = Plant.all.ids - plants_id_arr
    display_plants_arr = add_plants_list.map {|plant| Plant.where(id: plant)}
    @add_plants = display_plants_arr.flatten(1)
    session[:url] = 'my_plants'
    if @plants.length == 0
        redirect '/plants/new'
    else
        erb :my_plants
    end
end

get '/plants/new' do
    redirect '/login' unless logged_in?
    user_todos = Todo.where(user_id: current_user.id)
    plantsarr = user_todos.map {|todo| todo.plant_id }
    plants_id_arr = plantsarr.uniq
    add_plants_list = Plant.all.ids - plants_id_arr
    display_plants_arr =    add_plants_list.map {|plant| Plant.where(id: plant)}
    @plants = display_plants_arr.flatten(1)
    session[:url] = 'my_plants'
    erb :add_plants
end

post '/my_plants' do
    redirect '/login' unless logged_in?
    plants_selected= params["plantSelected"]
    plants_id_array = plants_selected.map(&:to_i)

    
    plant_names = plants_id_array.map { |plant_id| Plant.find(plant_id).common_name }
    if plant_names.length == 1
        session[:plants_added] = plant_names[0] + " has been added."
    else
        session[:plants_added] = plant_names[0..-2].join(', ') + ' and ' + plant_names[-1] + " have been added."
    end

    session[:plants_added] = session[:plants_added].upcase
    plants_id_array.each do |plantid|
        
        tasks = Task.where(plant_id: plantid)
        tasks.each do |task|
            todo = Todo.new
            # todo.user_id = User.first.id
            todo.user_id = current_user.id
            # change to current user once complete
            todo.plant_id = task.plant_id
            todo.task_id = task.id
            todo.complete = false;
            todo.save
        end
    end
    redirect '/my_plants'
end

delete '/my_plants/:id' do
    redirect '/login' unless logged_in?
    Todos = Todo.where(plant_id: params[:id])
    current_user_todos = Todos.select {|todo| todo.user_id == current_user.id}
    current_user_todos.each {|todo| todo.delete}

    session[:plants_deleted] = Plant.find(params[:id]).common_name + " has been deleted."
    session[:plants_deleted] = session[:plants_deleted].upcase
    redirect '/my_plants'
end

