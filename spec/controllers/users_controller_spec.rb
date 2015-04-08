require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  Given(:user){create(:user)}
  render_views

  describe "GET 'show'" do
    context "signed in users" do
      When do
        sign_in(user)
        get(:show, id: user)
      end

      Then{expect(response).to be_success}
        And{expect(response).to render_template(:show)}
        And{expect(assigns(:user)).to be == user}
    end

    context "non signed in users" do
      When{get :show, id: user}

      Then{expect(response).to redirect_to(new_user_session_path)}
    end
  end

  describe "GET 'index'" do
    context "signed in users" do
      Given(:all_users){User.all}
      When do
        sign_in(user)
        get(:index, id: user)
      end

      Then{expect(response).to be_success}
        And{expect(response).to render_template(:index)}
    end

    context "non signed-in users" do
      When{get :index}
      Then{expect(response).to redirect_to(new_user_session_path)}
    end
  end

  describe "DELETE 'destroy'" do
    describe "signed in users" do
      context "for admin users" do
        Given(:admin){User.create(email: "admin@user.com", password: "secret00", password_confirmation: "secret00", admin: true)}
        Given{sign_in(admin)}
        When(:delete_user){delete(:destroy, id: user)}
        # FIXME: after deleting a user it cant be found but User.count remains unchanged
        Then{expect(delete_user).to change(User, :count).by(-1)}
      end

      context "for non admin users" do
        Given{sign_in(user)}
        When{delete(:destroy, id: user)}
        Then{expect(response).to redirect_to(home_path)}
      end
    end

    describe "non signed in users" do
      When{delete(:destroy, id: user)}
      Then{expect(response).to redirect_to(new_user_session_path)}
    end
  end
end
