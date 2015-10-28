require 'rails_helper'

describe 'delete a food item process' do
  before do
    @food = FactoryGirl.create(:food)
  end

  it 'can update a new food item' do
    visit food_path(@food)
    click_on 'Delete'
    expect(page).to_not have_content @food.name
    expect(page).to_not have_content @food.calorie_count.count
  end
end
