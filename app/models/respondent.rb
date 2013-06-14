class Respondent < ActiveRecord::Base
  belongs_to :users
  belongs_to :surveys
end
