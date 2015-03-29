require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  context "show page" do
    before do
      @user = create(:user)
      get :show, id: @user
    end

    describe "GET 'show'" do
      it "should be successful" do
        expect(response).to be_success
      end

      it "should find the right user" do
        expect(assigns(:user)).to be == @user
      end
    end
  end
end
