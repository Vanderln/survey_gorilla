questions = <<-QUESTIONS
Which celebrity do you get mistaken for?
What do you want to be when you grow up?
When you have 30 minutes of free-time, how do you pass the time?
What would you name the autobiography of your life?
What songs are included on the soundtrack to your life?
What kind of home would you like?
What do you want to be when you grow up?
Where do you see yourself in 5 years?
Do you like candy necklaces?
Do you listen to music every day?
Do you still go trick or treating?
What was the last thing you ate?
Are you a fast typer?
Whats your favorite type of soda?
Have you ever moved? l
Have you ever won an award?
Are you listening to music right now?
They're the best of friends, but which do you prefer? Mark Twain's Tom Sawyer or Huck Finn?
When were you the saddest in your whole life?
If you were stranded on a deserted beach, what one person would you choose to spend the rest of your sunny days with?
If you could choose to dye your hair, what color would you choose?
If you could only eat one food for the rest of your life, what would you choose?
If you could only drink one particular drink for the rest of your life, which would you choose?
If you could live anywhere in the world, where would it be?
If you could only watch one movie for the rest of your life, which would you choose?
If you could bring one fictional character to life, who would you choose?
A chicken attacks you, what do you do first?
QUESTIONS

titles = <<-TITLES
Rare life choices
Choose your own adventure
This or that
Fictional Character Tournament
Emo vs Goth
Would you rather?
Have you ever?
If you had to choose...
Six Degrees of Kevin Bacon
TITLES

choices = <<-CHOICES
Pancakes
Waffles
Eggs
Toast
Peanut butter
Jelly
Milk
Cookies
Halloween
Barbie
Bella Swann
Throw broth at him like it was holy water?
Take an egg hostage?
Whip out a KFC container and look menacing.
Stuart Little
Spongebob Squarepants
Indiana Jones
Charlie's Angels
Charles Xavier (aka Professor X)
King Arthur
Christmas
Scotland
Ireland
England
Paris
Easter
Thanksgiving
TV
Video games
Console gaming
PC gaming
CHOICES

question_seed = questions.each_line.to_a
title_seed = titles.each_line.to_a
choice_seed = choices.each_line.to_a


10.times do 
  User.create(:username => Faker::Internet.user_name, :password => "password")
end


titleme = title_seed.shuffle
9.times do 
  Survey.create(
    :title => title_seed.shift.strip, 
    :author => User.find(1 + rand(10))
    )
end

surveys = ((1..29).to_a).shuffle
26.times do
  question = Question.create(
    content: question_seed.sample.strip, 
    survey_id: surveys.pop
    )
end

100.times do
  Choice.create(
    :question_id => 1 + rand(26), 
    :content => choice_seed.sample.strip
    )
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
