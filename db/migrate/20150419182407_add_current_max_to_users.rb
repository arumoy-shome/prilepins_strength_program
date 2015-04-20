class AddCurrentMaxToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_max, :text
  end
end
