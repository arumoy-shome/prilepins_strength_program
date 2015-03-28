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
        it "should be invalid" do
          @user.update(email: "")
          expect(@user).to be_invalid
        end
      end

      describe "invalid format" do
        before{@invalid_addresses = %w[user@foo,com user_at_foo.org example.user@foo.]}
        it "should be invalid" do
          @invalid_addresses.each do |address|
            @user.update(email: address)
            expect(@user).to be_invalid
          end
        end
      end

      context "not unique" do
        describe "lower case" do
          before{@duplicate_email = @user.email}
          it "should be invalid" do
            expect(User.create(email: @duplicate_email)).to be_invalid
          end
        end

        describe "upper case" do
          before{@duplicate_upcase_email = @user.email.upcase}
          it "should be invalid" do
            expect(User.create(email: @duplicate_upcase_email)).to be_invalid
          end
        end
      end
    end

    context "with invalid password" do
      describe "not present" do
        it "should be invalid" do
          @user.update(password: "")
          expect(@user).to be_invalid
        end

      describe "length too short" do
        it "should be invalid" do
          @user.update(password: "secret")
          expect(@user).to be_invalid
        end

      describe "password and password_confirmation do not match" do
        it "should be invalid" do
          @user.update(password: "secret00", password_confirmation: "secrete00")
          expect(@user).to be_invalid
        end
      end
      end
      end
    end
  end



end
