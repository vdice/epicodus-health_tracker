require 'rails_helper'

describe "the search feature" do
  before do
    @sushi = FactoryGirl.create(:food, :name => 'sushi')
    @rice = FactoryGirl.create(:food, :name => 'rice')
  end

  it "will return a result based on the query" do
    visit root_path
    fill_in 'search', :with => "sushi"
    click_on "search"
    expect(page).to_not have_content "rice"
    expect(page).to have_content "sushi"
  end
end
