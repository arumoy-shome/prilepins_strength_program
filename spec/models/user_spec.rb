require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each){@user = create(:user)}
  subject{@user}

  #general tests
  it{should respond_to(:email)}
  it{should respond_to(:password)}
  it{should respond_to(:password_confirmation)}
  it{should be_valid}

  context "with invalid credentials" do
    context "with invalid email" do
      describe "not present" do
        it{should validate_presence_of(:email)}
      end

      describe "invalid format" do
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

    context "with invalid" do
      context "password" do
        describe "not present" do
          it{should validate_presence_of(:password)}
        end

        describe "length too short" do
          it{should validate_length_of(:password)}
        end
      end

      context "password_confirmation" do
        describe "not present" do
          it{should validate_presence_of(:password)}
        end
      end
    end

    describe "password and password_confirmation do not match" do
      it{should validate_confirmation_of(:password)}
    end
  end
end
