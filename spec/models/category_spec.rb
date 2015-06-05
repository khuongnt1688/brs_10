require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = FactoryGirl.build :category
  end

  it "should be valid" do
    expect(@category).to be_valid
  end

  # describe "Content" do
  #   it "should invalid when empty" do
  #     @category.content = nil
  #     expect(@category).not_to be_valid
  #   end

  #   it "should be uniqueness" do
  #     @category.content = "poetry"
  #     @category.save
  #     other_category = FactoryGirl.build :category
  #     other_user.email = "poetry"
  #     expect(other_category).not_to be_valid
  #   end

  #   it "should valid when maximum length smaller than 100" do
  #     @category.content = "tenloaisach"
  #     expect(@category).to be_valid
    # end
  # end  
end
