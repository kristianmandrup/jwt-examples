FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Test Post #{n}" }
    user
  end
end