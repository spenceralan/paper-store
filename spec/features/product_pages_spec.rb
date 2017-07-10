require 'rails_helper'

feature "Products" do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:product) { create(:product) }
  

  scenario "anonynous users can visit the products page" do
    visit root_path
    click_link("Products")
    expect(page).to have_content("Browse our amazing selection of paper products!")
  end

  scenario "logged in users can visit the products page" do
    login_as(user, scope: :user)
    visit root_path
    click_link("Products")
    expect(page).to have_content("Browse our amazing selection of paper products!")
  end

  scenario "admin users can visit the products page" do
    login_as(admin, scope: :user)
    visit root_path
    click_link("Products")
    expect(page).to have_content("Browse our amazing selection of paper products!")
  end

  scenario "admin can navigate to new product path" do
    login_as(admin, scope: :user)
    visit products_path
    click_link("Add Product")
    expect(page).to have_content("New Product")
    expect(page).to have_content("Name")
    expect(page).to have_content("Description")
    expect(page).to have_button("Create Product")
  end

  scenario "user cannot navigate to the new product path" do
    login_as(user, scope: :user)
    visit new_product_path
    expect(page).to have_content("You are already signed in.")
    expect(page).to have_content("Welcome to The Paper Company!")
  end

  scenario "admin can create a new product" do
    product = build(:product)
    login_as(admin, scope: :user)
    visit new_product_path
    fill_in "Name", with: product.name
    fill_in "Description", with: product.description
    fill_in "Price", with: product.price
    click_button("Create Product")
    expect(page).to have_content(product.name)
  end

  scenario "display an error if new product is missing name" do
    product = build(:product)
    login_as(admin, scope: :user)
    visit new_product_path
    fill_in "Description", with: product.description
    fill_in "Price", with: product.price
    click_button("Create Product")
    expect(page).to have_content("Please fix these errors")
  end

  scenario "admin can navigate to a product details page" do
    product
    login_as(admin, scope: :user)
    visit products_path
    click_link(product.name)
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
  end

  scenario "user can navigate to a product details page" do
    product
    login_as(user, scope: :user)
    visit products_path
    click_link(product.name)
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
  end

  scenario "anonymous users can navigate to a product details page" do
    product
    visit products_path
    click_link(product.name)
    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
  end

  scenario "admin can navigate to a products edit page" do
    product
    login_as(admin, scope: :user)
    visit product_path(product)
    click_link("Edit Product")
    expect(page).to have_content("Edit Product")
  end

  scenario "user cannot navigate to the edit product path" do
    product
    login_as(user, scope: :user)
    visit edit_product_path(product)
    expect(page).to have_content("You are already signed in.")
    expect(page).to have_content("Welcome to The Paper Company!")
  end

  scenario "admin can edit a product" do
    login_as(admin, scope: :user)
    visit edit_product_path(product)
    fill_in "Name", with: "New Test Name"
    click_button("Update Product")
    expect(page).to have_content("New Test Name")
  end

  scenario "admin cannot update a product with a missing name" do
    login_as(admin, scope: :user)
    visit edit_product_path(product)
    fill_in "Name", with: ""
    click_button("Update Product")
    expect(page).to have_content("Please fix these errors")
  end

  scenario "admin can delete a product" do
    login_as(admin, scope: :user)
    visit product_path(product)
    click_link("Delete Product")
    expect(page).to have_content("The product has been deleted.")
  end

end