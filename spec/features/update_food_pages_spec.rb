require 'rails_helper'

describe 'update a food item process' do
  before do
    @food = FactoryGirl.create(:food)
  end

  it 'can update a new food item' do
    visit food_path(@food)
    click_on 'Edit'
    fill_in 'Name', :with => 'Honeycrisp Apple'
    fill_in 'Count', :with => '90'
    click_on 'Update Food'
    expect(page).to have_content 'Honeycrisp Apple'
    expect(page).to have_content '90'
  end

  it 'throw errors if a field is empty' do
    visit food_path(@food)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_on 'Update Food'
    expect(page).to have_content 'errors'
  end
end
