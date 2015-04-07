require 'rails_helper'

RSpec.describe User, type: :model do

  context "creating a user" do
    When(:user){create(:user)}
    Then{expect(user).to be_valid}
      And{expect(user).to respond_to(:email)}
      And{expect(user).to have_db_index(:email)}
      And{expect(user).to respond_to(:password)}
      And{expect(user).to respond_to(:password_confirmation)}
  end

  context "destroying a user" do
    Given(:user){create(:user)}
    When{user.destroy}
    Then do
      user.posts.each do |post|
        expect(Post.find(post)).to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  #relation tests
  context "posts attribute" do
    Given(:user){create(:user)}
    Then{expect(user).to respond_to(:posts)}
      And{expect(user).to have_many(:posts)}

    context "multiple posts" do
      When do
        @post1 = Post.create(content: "this is the first post", user: user, created_at: 1.day.ago)
        @post2 = Post.create(content: "this is the second post", user: user, created_at: 1.hour.ago)
      end

      Then{expect(user.posts).to be == [@post2, @post1]}
    end
  end

  #validation tests
  describe "validations" do
    Given(:user){create(:user)}

    describe "with invalid email" do
      context "not present" do
        When{user.update(email: "")}
        Then{expect(user).to validate_presence_of(:email)}
      end

      context "invalid format" do
        Given(:invalid_addresses){%w[user@foo,com user_at_foo.org example.user@foo.]}
        When do
          invalid_addresses.each do |address|
            user.update(email: address)
            Then{expect(user).not_to allow_value(address).for(:email)}
          end
        end
      end

      context "not unique" do
        When(:duplicate_user){create(:user)}
        Then{expect(duplicate_user).to validate_uniqueness_of(:email)}
      end
    end

    describe "with invalid password" do
      context "not present" do
        When{user.update(password: "")}
        Then{expect(user).to validate_presence_of(:password)}
      end

      context "length too short" do
        When{user.update(password: "secret")}
        Then{expect(user).to validate_length_of(:password)}
      end
    end

    describe "with invalid password confirmation" do
      context "not present" do
        When{user.update(password_confirmation: "")}
        Then{expect(user).to validate_presence_of(:password_confirmation)}
      end

      context "does not match password" do
        When{user.update(password_confirmation: "secrete00")}
        Then{expect(user).to validate_confirmation_of(:password)}
      end
    end
  end

  context "admin attribute" do
    When(:user){create(:user)}
    Then{expect(user).to respond_to(:admin)}
      And{expect(user).not_to be_admin}

    context "when I toggle admin on" do
      When{user.toggle!(:admin)}
      Then{expect(user).to be_admin}
    end
  end
end
