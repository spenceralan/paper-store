# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Product.destroy_all

admin = User.create(
  username: "admin",
  email: "admin@admin.com",
  password: "admin123456",
  password_confirmation: "admin123456",
  admin: true
)

user = User.create(
  username: "testuser",
  email: "test@test.com",
  password: "123456",
  password_confirmation: "123456"
)

250.times do
  number_of_words = Faker::Number.between(1, 5)
  number_of_reviews = Faker::Number.between(5, 30)
  rating = Faker::Number.between(1, 5)
  product = Product.create!(
    name: Faker::Hipster.words(number_of_words).join(" ").titleize,
    description: Faker::DrWho.catch_phrase,
    price: Faker::Number.decimal(2),
  )
  number_of_reviews.times do
    product.reviews.create!(
      user_id: user.id,
      content: Faker::RuPaul.quote,
      rating: rating,
    )
  end
end