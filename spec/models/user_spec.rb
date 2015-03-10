require 'rails_helper'

RSpec.describe User, type: :model do
  before{@user = User.new user_name: "Example User", email: "user@example.com"}
  subject{@user}
  it{should respond_to :user_name}
  it{should respond_to :email}
  it{should be_valid}

  describe "when user_name is not present" do
    before{@user.user_name = ""}
    it{should_not be_valid}
  end

  descibe "when name is too long" do
    before{@user.user_name = "a"*51}
    it{should_not be_valid}
  end

  describe "when email format is invalid" do
  end

  describe "when email format is valid" do
  end
end
