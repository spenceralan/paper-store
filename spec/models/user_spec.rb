require 'rails_helper'

describe User do
  it { should validate_presence_of :email }
  it { should validate_presence_of :username }
  it { should have_many :reviews }

  subject { User.new(email: "test@test.com", username: "testuser") }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_uniqueness_of(:username).case_insensitive }

  it { should have_attached_file(:avatar) }
  it { should validate_attachment_content_type(:avatar).
    allowing("image/png", "image/gif").
    rejecting("text/plain", "text/xml") }

  it 'creates an admin account' do
    user = FactoryGirl.create(:admin)
    user.admin.should eq true
  end

  it 'creates a user account' do
    user = FactoryGirl.create(:user)
    user.admin.should eq false
  end

end