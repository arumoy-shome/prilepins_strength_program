require 'rails_helper'

RSpec.describe User, type: :model do
  before{@user = User.new user_name: "Example User", email: "user@example.com", password: "secret", password_confirmation: "secret"}
  subject{@user}

	#general tests
  it{should respond_to :user_name}
  it{should respond_to :email}
	it{should respond_to :password_digest}
	it{should respond_to :password}
	it{should respond_to :password_confirmation}
  it{should be_valid}

  #user_name tests
	describe "when user_name is not present" do
    before{@user.user_name = ""}
    it{should_not be_valid}
  end

  describe "when user_name is too long" do
    before{@user.user_name = "a"*51}
    it{should_not be_valid}
  end

#email tests
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo_.org example.user@foo. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
			addresses.each do |invalid_address|
				@user.email  = invalid_address
				expect(@user).not_to be_valid
			end
    end
  end

	describe "when email is in mixedcase" do
		let(:mixed_address){"FoO@eXaMPlE.COm"}
		it "should be saved as lowercase" do
			@user.email = mixed_address
			@user.save
			expect(@user.reload.email).to eq mixed_address.downcase
		end
	end

  describe "when email format is valid" do
		it "should be valid" do
			addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
			addresses.each do |valid_address|
				@user.email = valid_address
				expect(@user).to be_valid
			end
		end
  end

	describe "when email address is already taken" do
		before do
			duplicate_email_user = @user.dup
			duplicate_email_user.save
		end
		it{should be_invalid}
	end

	describe "when email address is uppercase" do
		before do
			duplicate_email_user = @user.dup
			duplicate_email_user.email = @user.email.upcase
			duplicate_email_user.save
		end
		it{should be_invalid}
	end

	#password tests
	describe "when password is not present" do
		before{@user = User.new(user_name: "Example user", password: "", password_confirmation: "")}
		it{should_not be_valid}
	end

	describe "when password and confirmation mismatch" do
		before{@user.password_confirmation = "mismatch"}
		it{should_not be_valid}
	end

	describe "when password is to short" do
		before{@user.password = @user.password_confirmation = "a"*5}
		it{should_not be_valid}
	end

	describe "return value of authentication method" do
		before{@user.save}
		let(:found_user){User.find_by(email: @user.email)}

		describe "with valid password" do
			it{should eq found_user.authenticate(@user.password)}
		end

		describe "with invalid password" do
			let(:user_for_invalid_password){found_user.authenticate("invalid")}
			it{should_not eq user_for_invalid_password}
		end
	end
end
