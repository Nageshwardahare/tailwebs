# spec/factories/users.rb
FactoryBot.define do
  factory :teacher do
    email { "test@example.com" }
    password { "password" }
  end
end
