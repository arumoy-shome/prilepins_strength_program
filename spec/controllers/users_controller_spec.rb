require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  context "show page" do
    before do
      @user = create(:user)
      get :show, id: @user
    end
    subject{response}

    context "views" do
      it{should render_template(:show)}
      it_behaves_like "application template"
      it{should have_css("img.gravatar")}
      it{should have_selector('h3', text: @user.email)}
      it{should have_selector('table')}
    end

    context "controller" do
      describe "GET 'show'" do
        it{should be_success}

        it "should find the right user" do
          expect(assigns(:user)).to be == @user
        end
      end
    end
  end
end
