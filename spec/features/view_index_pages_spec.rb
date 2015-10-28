require 'rails_helper'

describe 'index pages' do
  before do
    @foods = [FactoryGirl.create(:food),
              FactoryGirl.create(:food, :name => 'Oatmeal')]
    @exercises = [FactoryGirl.create(:exercise)]
  end

  it 'shows a listing of current foods and exercises' do
    visit root_path
    expect(page).to have_content @foods[0].name
    expect(page).to have_content @foods[1].name
    expect(page).to have_content @exercises[0].name
    expect(page).to have_content @foods[0].calorie_count.count
    expect(page).to have_content @foods[1].calorie_count.count
    expect(page).to have_content @exercises[0].calorie_count.count
  end
end
