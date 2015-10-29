require 'rails_helper'

describe "the search feature", js: true do
  it "will return a result based on the query" do
    FactoryGirl.create(:food, :name => 'sushi')
    FactoryGirl.create(:food, :name => 'rice')

    visit root_path
    fill_in 'search', :with => "sushi"
    click_on "search"
    expect(page).to_not have_content "rice"
    expect(page).to have_content "sushi"
  end
end
