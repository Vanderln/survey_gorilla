class Choice < ActiveRecord::Base
  belongs_to :question

  has_many :responses
  has_many :respondents, :through => :responses,
           :class_name => "User",
           :foreign_key => :user_id
  
end
