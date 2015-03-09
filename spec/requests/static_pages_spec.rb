require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "Home page" do

    it "should have the right title" do
      visit '/'
      expect(page).to have_title("Home")
    end

    it "should have the content 'Hello there!'" do
      visit root_path
      expect(page).to have_content('Hello there!')
    end

    # it "should have a sign up button" do
    #   visit '/'
    #   expect(page).to have
    # end
  end

  describe "About page" do

    it "should have the right title" do
      visit about_path
      expect(page).to have_title("About")
    end

    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end
  end

  describe "Contact page" do

    it "should have the right title" do
      visit contact_path
      expect(page).to have_title("Contact")
    end

    it "should have the content 'Contact Us'" do
      visit contact_path
      expect(page).to have_content('Contact Us')
    end
  end
end
