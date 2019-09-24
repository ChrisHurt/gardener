require 'pry'
get '/todos' do
    redirect '/login' unless logged_in?

    #  Reference SQL
    # "SELECT tasks.name, tasks.due_date, todos.plant_id, plants.common_name, todos.user_id FROM todos INNER JOIN tasks ON tasks.id = todos.task_id INNER JOIN plants ON plants.id = todos.plant_id WHERE todos.user_id = 9 ORDER BY due_date DESC;"
    @todos = Todo.joins(:plant, :task).includes(:plant, :task).where(user_id: current_user.id).order(due_date: :desc)
   
    # .where(due_date: 2.weeks.ago..2.months.from_now)

    session[:url] = 'todos'
    erb :to_do
end

post '/api/todos' do
    redirect '/login' unless logged_in?
    todo = Todo.find_by(id: params[:todo_id])
    if todo != nil && todo.complete == 1
        todo.complete = 0;
    elsif todo != nil
        todo.complete = 1;
    end
    todo.save
end

get '/api/todos/complete' do
    redirect '/login' unless logged_in?
    content_type :json
    @todos = Todo.joins(:plant, :task).includes(:plant, :task).where(user_id: current_user.id).where(complete: 1).order(due_date: :asc)
    @todos = @todos.map { |todo| 
        {
            'todo_id' => todo.id,
            'due_date_month' => Date::MONTHNAMES[todo.task.due_date.month][0..2],
            'due_date_day' => todo.task.due_date.day,
            'task_name' => todo.task.name,
            'plant_common_name' => todo.plant.common_name,
            'complete' => todo.complete
        }
    }
    @todos.to_json
end

get '/api/todos/incomplete' do
    redirect '/login' unless logged_in?
    # Need to filter todos by user id's
    # .where(due_date: 2.weeks.ago..2.months.from_now)
    content_type :json
    @todos = Todo.joins(:plant, :task).includes(:plant, :task).where(user_id: current_user.id).where(complete: 0).order(due_date: :asc)
    @todos = @todos.map { |todo| 
        {
            'todo_id' => todo.id,
            'due_date_month' => Date::MONTHNAMES[todo.task.due_date.month][0..2],
            'due_date_day' => todo.task.due_date.day,
            'task_name' => todo.task.name,
            'plant_common_name' => todo.plant.common_name,
            'complete' => todo.complete
        }
    }
    @todos.to_json
end