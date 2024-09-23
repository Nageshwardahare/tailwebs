# spec/factories/students.rb
FactoryBot.define do
  factory :student do
    name { "John Doe" }
    subject { "Mathematics" }
    marks { 90 }
  end
end
