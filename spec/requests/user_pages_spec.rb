require 'rails_helper'

RSpec.describe "UserPages", type: :request do
  subject{page}

  describe "Sign up page" do
    before{visit signup_path}

    it{should have_content "Sign Up"}
    it{should have_selector 'h1', text: "Sign Up"}
  end
end
