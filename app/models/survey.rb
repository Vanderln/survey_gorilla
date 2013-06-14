class Survey < ActiveRecord::Base
  has_many :respondents
  has_many :users, :through => :respondents
  belongs_to :author, :class_name => "User"
end
