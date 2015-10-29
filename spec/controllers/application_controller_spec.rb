require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do

  before do
    @food = FactoryGirl.create(:food, :name => 'sushi')
    @food = FactoryGirl.create(:food, :name => 'rice')
  end

  it 'searches if search term supplied' do
    @results = controller.search(Food, 'sushi')
    expect(@results.first.name).to eq 'sushi'
  end

  it 'returns empty scope if no search term supplied' do
    @results = controller.search(Food, nil)
    expect(@results.count).to eq 2
  end
end
