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
      it "should find all users" do
        expect(assigns(:all_users).count).to be == all_users.count
      end
    end

    context "for not signed-in users" do
      before{get :index}
      it{should redirect_to(new_user_session_path)}
    end
  end
end
