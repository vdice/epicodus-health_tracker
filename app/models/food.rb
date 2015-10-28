class Food < ActiveRecord::Base
  has_one :calorie_count, as: :countable
  accepts_nested_attributes_for :calorie_count
  validates :name, presence: true
end
