require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.build :user
  end

  it "should is valid" do
    expect(@user).to be_valid
  end

  describe "Email" do
    it "should invalid when empty" do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it "should be uniqueness" do
      @user.email = "khuong1234@gmail.com"
      @user.save
      other_user = FactoryGirl.build :user
      other_user.email = "khuong1234@gmail.com"
      expect(other_user).not_to be_valid
    end

    it "should invalid when wrong format" do
      @user.email = "khuong.com"
      expect(@user).not_to be_valid
    end

    it "should down-case after save" do
      @user.email = "PhongHenry@gmail.com"
      @user.save
      expect(@user.email).to eql "phonghenry@gmail.com"
    end
  end

  describe "Password" do
    it "should invalid when minimum length smaller than 6" do
      @user.password = "123"
      expect(@user).not_to be_valid
    end
  end

  # describe User, 'validation' do
  #   it {is_expected.to validate_presence_of(:name)}
  #   it {is_expected.to validate_uniqueness_of(:name)}
  #   it {is_expected.to ensure_length_of(:name).is_at_most(100)}

  #   it {is_expected.to validate_presence_of(:email)}
  #   it {is_expected.to validate_uniqueness_of(:email)}
  #   it {is_expected.to ensure_length_of(:email).is_at_most(50)}

  #   it {is_expected.to validate_presence_of(:role)}
  #   it {is_expected.to ensure_length_of(:role).is_at_most(50)}
  # end

  # describe User, 'association' do
  #   it {is_expected.to have_many(:requests)}
  #   it {is_expected.to have_many(:reviews)}
  #   it {is_expected.to have_many(:comments)}
  #   it {is_expected.to have_many(:activities)}
  #   it {is_expected.to have_many(:likes)}
  #   it {is_expected.to have_many(:active_relationships)}
  #   it {is_expected.to have_many(:passive_relationships)}
  #   it {is_expected.to have_many(:following)}
  #   it {is_expected.to have_many(:followers)}
  #   it {is_expected.to have_many(:book_states)}
  #   it {is_expected.to have_many(:favorites)}
  #   # it { should have_many(:categories).through(:categorizations) }
  # end

  # describe User, 'column_specification' do
  #   it {is_expected.to have_db_column(:name).of_type(:string).with_options(length: {maximum: 100}, presence: true, uniqueness: true)}
  #   it {is_expected.to have_db_column(:email).of_type(:string).with_options(length: {maximum: 50}, presence: true, uniqueness: true)}
  #   it {is_expected.to have_db_column(:role).of_type(:string).with_options(length: {maximum: 50}, presence: true)}
  # end 
end
