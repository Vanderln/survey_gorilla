class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :respondent, :class_name => "User",
             :foreign_key => :user_id
end
