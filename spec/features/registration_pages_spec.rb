require 'rails_helper'

feature "Sessions" do

  scenario "user can navigate to sign in page" do
    visit root_path
    click_link "Sign in"
    expect(page).to have_content("Log in")
    expect(page).to have_content("Forgot your password?")
  end

  scenario "displays the user's username after successful login with email" do
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_login', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content("testuser")
    expect(page).to have_content("Signed in successfully")
  end

  scenario "displays the user's username after successful login with username" do
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_login', with: user.username
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content("testuser")
    expect(page).to have_content("Signed in successfully")
  end

  scenario "displays error if password is missing" do
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_login', with: user.email
    click_button 'Log in'
    expect(page).to have_content("Invalid Login or password.")
  end

  scenario "displays error if password is incorrect" do
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_login', with: user.email
    fill_in 'user_password', with: "654321"
    click_button 'Log in'
    expect(page).to have_content("Invalid Login or password.")
  end

  scenario "displays error if username and email are missing" do
    user = create(:user)
    visit new_user_session_path
    fill_in 'user_password', with: user.password
    click_button 'Log in'
    expect(page).to have_content("Invalid Login or password.")
  end

  scenario "user can navigate to add an image page" do
    user = create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end

  scenario "logged out user cannot access new review path" do
    user = create(:user)
    product = create(:product)
    login_as(user, :scope => :user)
    logout(:user)
    visit new_product_review_path(product)
    expect(page).to have_content("You need to sign in or sign up before continuing.")
  end

  scenario "user can navigate to sign up page" do
    visit root_path
    click_link "Sign up"
    expect(page).to have_content("Sign up")
    expect(page).to have_content("(6 characters minimum)")
  end

  scenario "user can create a new account" do
    user = build(:user)
    visit new_user_registration_path
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content("You have signed up successfully.")
  end

  scenario "displays an error if the email is already taken" do
    user = create(:user)
    visit new_user_registration_path
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.username
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content("Email has already been taken")
  end

  scenario "displays an error if an email is used as username" do
    user = create(:user)
    visit new_user_registration_path
    fill_in 'user_email', with: user.email
    fill_in 'user_username', with: user.email
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password
    click_button 'Sign up'
    expect(page).to have_content("Email has already been taken")
  end

end