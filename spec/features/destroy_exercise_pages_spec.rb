require 'rails_helper'

describe 'delete an exercise item process' do
  before do
    @exercise = FactoryGirl.create(:exercise)
  end

  it 'can update a new exercise item' do
    visit exercise_path(@exercise)
    click_on 'Delete'
    expect(page).to_not have_content @exercise.name
    expect(page).to_not have_content @exercise.calorie_count.count
  end
end
