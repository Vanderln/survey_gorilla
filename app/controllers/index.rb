get '/' do
  erb :index
end

post '/login' do
  user = User.authenticate(params[:username],params[:password])
  if user.valid?
    session[:user_id] = user.id
    redirect '/users/:user_id'
  else
    redirect '/login'
  end
end

post '/signup' do
  # validate and enter new user into DB
  # start new session
  # direct to user page
  # session[:user_id] = @user.id
  redirect '/users/:user_id'
end

get '/users/:user_id' do
  if logged_in?
    @author_surveys = Survey.find_all_by_user_id(current_user.id)
    @all_surveys = Survey.order('updated_at DESC')
    erb :user_page
  else
    redirect '/login'
  end
end

get '/create' do
  # render form to author new survey
  erb :survey_create
end

post '/create' do
  # create new survey with current user session
  redirect '/users/:user_id'
end

get '/surveys/:survey_id' do
  # render survey as form to answer
  erb :survey_take
end

post '/surveys/:survey_id' do
  # submit survey form under current user session
  redirect '/users/:user_id'
end

get '/surveys/stats/:survey_id' do
  # render survey title, questions, and choices
  # also render number of responses for each choice
  erb :survey_stats
end





