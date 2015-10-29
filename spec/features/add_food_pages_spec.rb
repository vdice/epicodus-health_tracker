require 'rails_helper'

describe 'add a food item process' do
  
  it 'can add a new food item', js: true do
    visit root_path
    click_on 'Add a new food'
    fill_in 'Name', :with => 'Honeycrisp Apple'
    fill_in 'Count', :with => '90'
    click_on 'Create Food'
    expect(page).to have_content 'Honeycrisp Apple'
    expect(page).to have_content '90'
  end

  it 'throw errors if a field is empty', js: true do
    visit root_path
    click_on 'Add a new food'
    click_on 'Create Food'
    expect(page).to have_content 'errors'
  end
end
