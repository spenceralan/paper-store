FactoryGirl.define do

  factory :user do
    username "testuser"
    email  "test@test.com"
    password "123456"
    password_confirmation "123456"
    admin false
  end

  factory :admin, class: User do
    username "adminuser"
    email  "admin@test.com"
    password "123456"
    password_confirmation "123456"
    admin true
  end

end