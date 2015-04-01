require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = create(:user)
    render
  end
  subject{rendered}

  context "GET 'show'" do
    context "page contents" do
      describe "sidebar" do
        it{should have_selector("div.sidebar>img.gravatar")}
        it{should have_selector("div.sidebar>h3", text: @user.email)}
        it{should have_selector("div.sidebar>h3", text: "Current squat max")}
      end

      describe "table" do
        it{should have_selector("div.container-fluid>table.table.table-striped")}
      end
    end
  end
end
