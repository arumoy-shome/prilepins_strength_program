require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  subject{page}

  describe "sign up page" do
    before{visit signup_path}
    it{should have_content("Sign Up")}
    it{should have_selector('h1', text: "Sign Up")}
  end

  describe "when signing up" do
    before{visit signup_path}
    let(:submit_button){"Create My Account"}

    describe "with invalid credentials" do
      it "should not sign user up" do
        expect{click_button submit_button}.not_to change(User, :count)
      end

      describe "after submission" do
        before{click_button submit_button}
        it{should have_content("error")}
      end
    end

    describe "with valid credentials" do
      before do
        fill_in "User name", with: "Example User"
        fill_in "Email", with: "example@user.com"
        fill_in "Password", with: "secret00"
        fill_in "Confirmation", with: "secret00"
      end
      it "should sign user up" do
        expect{click_button submit_button}.to change(User, :count)
      end

      describe "after submission" do
        before{click_button submit_button}
        let(:user){User.first}
        it{should have_title(user.user_name)}
        it{should have_selector('div.alert', text: "Welcome")}
      end
    end
  end

  describe "profile page" do
    let(:user){FactoryGirl.create(:user)}
    before{visit user_path(user.id)}
    it{should have_content(user.user_name)}
    it{should have_title(user.user_name)}
  end
end
