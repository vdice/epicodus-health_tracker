require "rails_helper"

describe "The sort feature" do
  before do
    @sushi = FactoryGirl.create(:food, :name => 'sushi', :calorie_count => CalorieCount.create(:count => 8))
    @rice = FactoryGirl.create(:food, :name => 'rice')

    @walking = FactoryGirl.create(:exercise, :name => 'walking', :calorie_count => CalorieCount.create(:count => 8))
    @running = FactoryGirl.create(:exercise, :name => 'running')
  end

  it 'will sort foods based on name', js: true do
    visit root_path

    find("#food-name-sort").click
    expect(page).to have_selector("#food-listing tr:nth-child(2) td:nth-child(1)", text: 'sushi')
    expect(page).to have_selector("#food-listing tr:nth-child(3) td:nth-child(1)", text: 'rice')

    find("#food-name-sort").click
    expect(page).to have_selector("#food-listing tr:nth-child(2) td:nth-child(1)", text: 'rice')
    expect(page).to have_selector("#food-listing tr:nth-child(3) td:nth-child(1)", text: 'sushi')
  end

  it 'will sort foods based on calories', js: true do
    visit root_path

    find("#food-calories-sort").click
    expect(page).to have_selector("#food-listing tr:nth-child(2) td:nth-child(1)", text: 'sushi')
    expect(page).to have_selector("#food-listing tr:nth-child(3) td:nth-child(1)", text: 'rice')

    find("#food-calories-sort").click
    expect(page).to have_selector("#food-listing tr:nth-child(2) td:nth-child(1)", text: 'rice')
    expect(page).to have_selector("#food-listing tr:nth-child(3) td:nth-child(1)", text: 'sushi')
  end

  it 'will sort exercises based on name', js: true do
    visit root_path

    find("#exercise-name-sort").click
    sleep 1
    expect(page).to have_selector("#exercise-listing tr:nth-child(2) td:nth-child(1)", text: 'walking')
    expect(page).to have_selector("#exercise-listing tr:nth-child(3) td:nth-child(1)", text: 'running')

    find("#exercise-name-sort").click
    sleep 1
    expect(page).to have_selector("#exercise-listing tr:nth-child(2) td:nth-child(1)", text: 'running')
    expect(page).to have_selector("#exercise-listing tr:nth-child(3) td:nth-child(1)", text: 'walking')
  end

  it 'will sort exercises based on calories', js: true do
    visit root_path

    find("#exercise-calories-sort").click
    sleep 1
    expect(page).to have_selector("#exercise-listing tr:nth-child(2) td:nth-child(1)", text: 'walking')
    expect(page).to have_selector("#exercise-listing tr:nth-child(3) td:nth-child(1)", text: 'running')

    find("#exercise-calories-sort").click
    sleep 1
    expect(page).to have_selector("#exercise-listing tr:nth-child(2) td:nth-child(1)", text: 'running')
    expect(page).to have_selector("#exercise-listing tr:nth-child(3) td:nth-child(1)", text: 'walking')
  end
end
