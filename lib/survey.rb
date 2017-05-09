class Survey < ActiveRecord::Base
  has_many(:questions)
  validates(:name, :presence => true)
  before_save(:capitalize_title)


private

  def capitalize_title
    self.name = name().split.each(){|word| word.capitalize!}.join(' ')
  end

end
