class Question < ActiveRecord::Base
  has_many(:answers)
  belongs_to(:survey)
  validates(:question, :presence => true)
end
