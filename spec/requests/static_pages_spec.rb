require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "Home page" do

    it "should have the right title" do
      visit '/'
      expect(page).to have_title("Home")
    end

    it "should have the content 'Hello there!'" do
      visit '/'
      expect(page).to have_content('Hello there!')
    end

    # it "should have a sign up button" do
    #   visit '/'
    #   expect(page).to have
    # end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/about'
      expect(page).to have_content('About Us')
    end
  end
end
