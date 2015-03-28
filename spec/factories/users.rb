FactoryGirl.define do
  factory :user do |user|
    user.email "example@user.com"
    user.password "secret00"
    user.password_confirmation "secret00"
  end
end
