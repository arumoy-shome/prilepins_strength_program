FactoryGirl.define do
  factory :user do |user|
    user.email "example@user.com"
    user.password "secret00"
  end

  factory :no_email_user do |user|
    user.email nil
    user.password "secret00"
  end

  factory :no_password_user do |user|
    user.email "example@user.com"
    user.password nil
  end

end
