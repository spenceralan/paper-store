require 'rails_helper'

feature "User Reviews" do

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:product) { create(:product) }

  scenario "user can navigate to add review page" do
    login_as(user, scope: :user)
    visit product_path(product)
    click_link "Add Review"
    expect(page).to have_content("New Review for #{product.name}")
  end

  scenario "user can add a review to a product" do
    review = build(:review)
    login_as(user, scope: :user)
    visit new_product_review_path(product)
    fill_in 'Content', with: review.content
    fill_in 'Rating', with: review.rating
    click_button "Create Review"
    expect(page).to have_content(review.content)
  end

  scenario "display an error for a review missing content" do
    review = build(:review)
    login_as(user, scope: :user)
    visit new_product_review_path(product)
    fill_in 'Rating', with: review.rating
    click_button "Create Review"
    expect(page).to have_content("Please fix these errors")
  end


# clearly poorly written, refactor with better understanding of factory girl associations
  scenario "admin successfully deletes a user review" do
    review = build(:review)
    login_as(user, scope: :user)
    visit new_product_review_path(product)
    fill_in 'Content', with: review.content
    fill_in 'Rating', with: review.rating
    click_button "Create Review"
    logout(user)
    login_as(admin, scope: :user)
    visit product_path(product)
    click_on "Delete Review"
    expect(page).not_to have_content(review.content)
    expect(page).to have_content("The review was sucessfully deleted.")
  end

end