require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each){@user = create(:user)}
  subject{@user}

  #general tests
  it{should respond_to(:email)}
  it{should respond_to(:password)}
  it{should respond_to(:password_confirmation)}
  it{should be_valid}

  describe "with invalid credentials" do
    describe "with invalid email" do
      context "not present" do
        it{should validate_presence_of(:email)}
      end

      context "invalid format" do
        before{@invalid_addresses = %w[user@foo,com user_at_foo.org example.user@foo.]}
        it "should be invalid" do
          #for should_not, shoulda-matcha does not test all assestions
          #if the first one fails
          #thus test all assertions individually
          @invalid_addresses.each do |address|
            should_not allow_value(address).for(:email)
          end
        end
      end

      context "not unique" do
        it{should validate_uniqueness_of(:email)}
      end
    end

    describe "with invalid password" do
      context "not present" do
          it{should validate_presence_of(:password)}
      end

      context "length too short" do
        it{should validate_length_of(:password)}
      end
    end

    describe "with invalid password confirmation" do
      context "not present" do
        it{should validate_presence_of(:password)}
      end

      context "does not match password" do
        it{should validate_confirmation_of(:password)}
      end
    end
  end

  describe "admin attribute" do
    it{should respond_to(admin)}
    it{should_not be_admin}
    it "should be convertible to admin" do
      @user.toggle!(:admin)
      @user.should be_admin
    end
  end
end
