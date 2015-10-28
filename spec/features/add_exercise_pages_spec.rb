require 'rails_helper'

describe 'add an exercise item process' do
  it 'can add a new exercise item' do
    visit root_path
    click_on 'Add a new exercise'
    fill_in 'Name', :with => 'Biking'
    fill_in 'Count', :with => '90'
    click_on 'Create Exercise'
    expect(page).to have_content 'Biking'
    expect(page).to have_content '90'
  end

  it 'throw errors if a field is empty' do
    visit root_path
    click_on 'Add a new exercise'
    click_on 'Create Exercise'
    expect(page).to have_content 'errors'
  end
end
