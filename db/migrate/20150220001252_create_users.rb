class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password
      t.integer :squat_max
      t.integer :deadlift_max
      t.integer :bench_max

      t.timestamps null: false
    end
  end
end
