require 'rails_helper'

RSpec.describe "static_pages/home", type: :view do
  describe "content" do
    before{render}
    subject{rendered}

    it{should have_content("Hello there! Welcome to Prilepin's Strength.")}
    it{should have_selector('button.btn.btn-primary', text: "Sign Up!")}
  end
end
