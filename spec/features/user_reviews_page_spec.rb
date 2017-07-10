require 'rails_helper'

feature "User Reviews" do

  let(:user) { create(:user) }

  scenario "user can navigate to their reviews page" do
    login_as(user, scope: :user)
    visit root_path
    click_link "Edit Account"
    click_link "Your Reviews"
    expect(page).to have_content("Your Reviews")
  end

end