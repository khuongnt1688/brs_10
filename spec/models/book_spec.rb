require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryGirl.build :book
  end

  it "should is valid" do
    expect(@book).to be_valid
  end
end
