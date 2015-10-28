require 'rails_helper'

describe 'update an exercise item process' do
  before do
    @exercise = FactoryGirl.create(:exercise)
  end

  it 'can update a new exercise item' do
    visit exercise_path(@exercise)
    click_on 'Edit'
    fill_in 'Name', :with => 'Hiking'
    fill_in 'Count', :with => '90'
    click_on 'Update Exercise'
    expect(page).to have_content 'Hiking'
    expect(page).to have_content '90'
  end

  it 'throw errors if a field is empty' do
    visit exercise_path(@exercise)
    click_on 'Edit'
    fill_in 'Name', :with => ''
    click_on 'Update Exercise'
    expect(page).to have_content 'errors'
  end
end
