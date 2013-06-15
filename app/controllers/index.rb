get '/' do
  if logged_in?
    redirect "/users/#{current_user.id}"
  else
    erb :index
  end
end

post '/login' do
  user = User.authenticate(params[:username],params[:password])
  if user
    session.clear
    session[:user_id] = user.id
    redirect '/users/:user_id'
  else
    redirect '/'
  end
end

post '/signup' do
  user = User.new(params[:form])
  if user.save
    session.clear
    session[:user_id] = user.id
    redirect '/users/:user_id'
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/users/:user_id' do
  if logged_in?
    @surveys = Survey.order('updated_at DESC')
    erb :user_page
  else
    redirect '/'
  end
end

get '/create' do
  if logged_in?
    erb :survey_create
  else
    redirect '/'
  end
end

post '/create' do
  survey = Survey.create(:title => params.shift[1], :user_id => current_user.id)
  while kvp = params.shift do
    if kvp[0].start_with?("q")
      survey.questions << latest_question = Question.create(:content => kvp[1])
    else
      latest_question.choices << Choice.create(:content => kvp[1])
    end
  end
  redirect "/users/#{current_user.id}"
end

get '/surveys/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :survey_take
end

post '/surveys/:survey_id' do
  survey = Survey.find(params[:survey_id])
  Respondent.create({:user_id => params[:user_id], :survey_id => survey.id})
  survey.questions.each do |question|
     Response.create({:user_id => params[:user_id], :choice_id => params["#{question.id}"]})
  end
  redirect '/users/:user_id'
end

get '/surveys/stats/:survey_id' do
  # render survey title, questions, and choices
  # also render number of responses for each choice
  erb :survey_stats
end





