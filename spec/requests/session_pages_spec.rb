require 'rails_helper'

RSpec.describe "SessionPages", type: :request do
  subject{page}

  describe "signin page" do
    before{visit signin_path}
    it{should have_content("Sign In")}
    it{should have_title("Sign In")}
  end

  describe "signin" do
    before{visit signin_path}

    describe "with invalid credentials" do
      before{click_button "Sign In"}
      it{should have_title("Sign In")}
      it{should have_selector('div.alert.alert-error')}

      describe "after visiting another page" do
        before{click_link "About"}
        it{should_not have_selector('div.alert.alert-error')}
      end
    end

    describe "with valid credentials" do
      let(:user){FactoryGirl.create(:user)}
      before do
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign In"
      end

      it{should have_title(user.user_name)}
      it{should have_link("Profile", href: user_path(user))}
      it{should have_link("Sign Out", href: signout_path)}
      it{should_not have_link("Sign In", href: signin_path)}

    end
  end
end
