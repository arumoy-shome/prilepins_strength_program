require_relative '20150405091935_create_posts'
class FixPosts < ActiveRecord::Migration
  def change
    revert CreatePosts

    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :content
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
