require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = create(:user)
    render
  end
  subject{rendered}

  describe "content" do
    context "sidebar" do
      it{should have_selector("div.sidebar>img.gravatar")}
      it{should have_selector("div.sidebar>h3", text: @user.email)}
      it{should have_selector("div.sidebar>h3", text: "Current squat max")}
      it{should have_selector("div.sidebar>h3", text: "Current bench max")}
      it{should have_selector("div.sidebar>h3", text: "Current deadlift max")}
    end

    context "table" do
      it{should have_selector("div.container-fluid>table.table.table-striped")}
    end
  end
end
