class CalorieCount < ActiveRecord::Base
  belongs_to :countable, polymorphic: true
  validates :count, presence: true
end
