class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices

  validate :content, :presence => true
end
