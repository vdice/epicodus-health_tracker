require 'rails_helper'

RSpec.describe CalorieCount, type: :model do
  it { should validate_presence_of :count }
  it { should belong_to :countable }
end
