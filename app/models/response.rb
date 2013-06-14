class Response < ActiveRecord::Base
  belongs_to :choice
  belongs_to :user
  # belongs_to :respondent, :class_name => "User",
  #            :foreign_key => :user_id
end
