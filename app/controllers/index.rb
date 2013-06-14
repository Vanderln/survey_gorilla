get '/' do
  erb :index
end

post '/login' do
  # authenticate?
  # start new session
  # direct to user page
  # session[:user_id] = @user.id
  redirect '/users/:user_id'
end

post '/signup' do
  # validate and enter new user into DB
  # start new session
  # direct to user page
  # session[:user_id] = @user.id
  redirect '/users/:user_id'
end

get '/users/:user_id' do
  # validate user is logged in?
  # redirect to login if not
  # if logged in render user page
  erb :user_page
end
