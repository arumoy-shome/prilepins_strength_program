require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "show page" do
    before do
      @user = create(:user)
      get :show, id: @user
    end
    subject{response}

    describe "views" do
      it{should render_template(:show)}
      it_behaves_like "application template"
    end

    describe "controller" do
      context "GET 'show'" do
        it{should be_success}

        it "should find the right user" do
          expect(assigns(:user)).to be == @user
        end
      end
    end
  end
end
