class Food < ActiveRecord::Base
  validates :name, presence: true
  has_one :calorie_count, as: :countable
end
