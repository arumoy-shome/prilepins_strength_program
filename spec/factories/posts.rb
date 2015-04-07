FactoryGirl.define do
  factory :post do |post|
    post.content "This is my first post!"
    post.association :user
  end
end
