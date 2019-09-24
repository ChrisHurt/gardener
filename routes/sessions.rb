
require 'pry'
get '/login' do 
  session[:url] = 'login'
  erb :signup
end

post "/sessions" do
  user = User.find_by(username: params[:email])
  if user == nil
    user = User.find_by(email: params[:email])
  end   
    
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id 
    redirect '/'
  else
    session[:login_error] = 'Invalid username, email or password'
    redirect '/login'
  end
end
delete '/sessions' do
  #1.destroy the session
  session[:user_id] = nil
  #2.redirect
  redirect '/login'
end

  
post "/createaccount" do
  user = User.new
  # user.username = params[:username]
  
  if params[:username] != ''
    user.username = params[:username]
  else 
    # This is a hard-coded solution, ideally I would filter through
    # the error messages and select what I want to return
    user.username = 'arbitrary name'
  end
  
  if params[:email] != ''
    user.email = params[:email]
  else 
    # This is a hard-coded solution, ideally I would filter through
    # the error messages and select what I want to return
    user.email = 'arbitrary email'
  end
  user.password = params[:password]

  
  user.save
  
  if user.valid?
    location = Location.new
    location.latitude = params[:lat]
    location.longitude = params[:long]
    
    location.user_id = user.id
    
    location.save
    session[:user_id] = user.id 
    redirect '/plants/new'
  else
    if user.errors != nil
      user.errors.messages.tap { |msg| msg.delete(:password_digest) }
      user.errors.messages.tap { |msg| msg.delete(:password) }
      session[:signup_error] = "#{user.errors.messages.keys.join(', ')} already taken"
    end
    redirect '/login'
  end
end
  
  
  
  