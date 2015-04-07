require 'rails_helper'

RSpec.describe Post, type: :model do
  Given(:user){create(:user)}

  describe "validations" do
    context "no user_id" do
      When(:invalid_post){Post.create(content: "This is an invalid post")}
      Then{expect(invalid_post).to be_invalid}
    end

    describe "invalid content" do
      context "no content" do
        When(:no_content_post){user.posts.create(content: "")}
        Then{expect(no_content_post).to be_invalid}
      end

      context "long content" do
        When(:long_post){user.posts.create(content: "a"*141)}
        Then{expect(long_post).to be_invalid}
      end
    end
  end

  context "user attribute" do
    When(:new_post){user.posts.create!(content: "This is a valid post")}
    Then{expect(new_post).to respond_to(:user)}
    And{expect(new_post).to belong_to(:user)}
    And{expect(new_post).to have_db_index(:user_id)}
    And{expect(new_post.user).to  be == user}
    And{expect(new_post.user_id).to be == user.id}
  end
end
