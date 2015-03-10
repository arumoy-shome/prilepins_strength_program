require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  subject{page}
  shared_examples_for "all StaticPages" do
      it{should have_selector 'h1', text: heading}
      it{should have_title title}
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title("About")
    click_link "Contact Us"
    expect(page).to have_title("Contact")
    click_link "Sign In"
    expect(page).to have_title("Sign In")

  end

  describe "Home page" do
    before{visit root_path}
    let(:heading) {"Hello there!"}
    let(:title) {"Home"}
    # it{should have_input("Sign Up")}
    it_should_behave_like "all StaticPages"
  end

  describe "About page" do
    before{visit about_path}
    let(:heading) {"About Us"}
    let(:title) {"About"}
    it_should_behave_like "all StaticPages"
  end

  describe "Contact page" do
    before{visit contact_path}
    let(:heading) {"Contact Us"}
    let(:title) {"Contact"}
    it_should_behave_like "all StaticPages"
  end
end
