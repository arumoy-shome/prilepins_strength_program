require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user){create(:user)}
  subject{response}
  render_views

  describe "GET 'show'" do
    context "for signed in users" do
      before do
        sign_in(user)
        get(:show, id: user)
      end

      it{should be_success}
      it{should render_template(:show)}
      it_behaves_like "application template"
      it "should find the right user" do
        expect(assigns(:user)).to be == user
      end
    end

    context "for not signed in users" do
      before{get :show, id: user}
      it{should redirect_to(new_user_session_path)}
    end
  end

  describe "GET 'index'" do
    context "for signed in users" do
      let(:all_users){User.all}
      before do
        sign_in(user)
        get(:index, id: user)
      end

      it{should be_success}
      it{should render_template(:index)}
      it_behaves_like "application template"
    end

    context "for not signed-in users" do
      before{get :index}
      it{should redirect_to(new_user_session_path)}
    end
  end

  describe "DELETE 'destroy'" do
    before{delete(:destroy, id: user)}

    context "for signed in users" do
      context "for admin users" do
        let(:admin){User.create(email: "admin@user.com", password: "secret00", password_confirmation: "secret00", admin: true)}
        before{sign_in(admin)}

        it "should destroy the user" do
          expect(lambda{delete(:destroy, id: user)}).to change(User, :count).by(-1)
        end
      end

      context "for non admin users" do
        before{sign_in(user)}
        it{should redirect_to(new_user_session_path)}
      end
    end

    context "for non signed in users" do
      it{should redirect_to(new_user_session_path)}
    end
  end
end
