require "rails_helper"

describe "The search feature" do
  it 'will sort based what you click' do
    FactoryGirl.create(:food, :name => 'sushi')
    FactoryGirl.create(:food, :name => 'rice')

  visit root_path

  click_link "food-name-sort"

  expect(page).to have_selector("#food-listing > table > tbody > tr:nth-child(2) > td:nth-child(1) > a", text: "sushi")
  end
end
