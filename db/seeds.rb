10.times do 
  User.create(:username => Faker::Internet.user_name, :password => "password")
end

20.times do 
  Survey.create(:title => Faker::Lorem.word, :author => User.find(1 + rand(10)))
end

25.times do
  Question.create(:content => Faker::Lorem.sentence, :survey_id => 1 + rand(20))
end

100.times do
  Choice.create(:question_id => 1 + rand(25), :content => Faker::Lorem.sentence)
end

# users = User.all

# User.all.each do |user|
#   Respondent.create(:survey_id => 1 + rand(20), :user_id => user.id)
#   Response.create(:choice_id => 1 + rand(100), :user_id => user.id)
# end
7.times do
  User.all.each do |user|
    user.responses << Response.create(:choice_id => 1 + rand(100), :user_id => user.id)
    user.respondents << Respondent.create(:survey_id => 1 + rand(20), :user_id => user.id)
  end
end
