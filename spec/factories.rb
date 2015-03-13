FactoryGirl.define do
  factory :user do
    user_name "Arumoy Shome"
    email "arumoy@example.com"
    password "secret00"
    password_confirmation "secret00"
  end

  factory :valid_user do
    user_name "Example User"
    email "example@user.com"
    password "secret00"
    password_confirmation "secret00"
  end
end
