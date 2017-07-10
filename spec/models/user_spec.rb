require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :username }
  it { should have_many :reviews }

  subject { User.new(email: "test@test.com", username: "testuser") }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_uniqueness_of(:username).case_insensitive }

  it 'creates an admin account' do
    user = FactoryGirl.create(:admin)
    user.admin.should eq true
  end

  it 'creates a user account' do
    user = FactoryGirl.create(:user)
    user.admin.should eq false
  end

end