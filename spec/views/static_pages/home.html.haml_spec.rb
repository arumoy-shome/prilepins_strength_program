require 'rails_helper'

RSpec.describe "static_pages/home", type: :view do
  describe "content" do
    before{render}
    specify{expect(rendered).to have_content("Hello there! Welcome to Prilepin's Strength.")}
    specify{expect(rendered).to have_css('button.btn.btn-primary', text: "Sign Up!")}
  end

  describe "clicking the sign up button" do
    before{find('button.btn.btn-primary.btn-lg').click}
    it "redirects you to the devise registation page" do
      expect(page).to have_content("Sign Up")
    end
  end
end
