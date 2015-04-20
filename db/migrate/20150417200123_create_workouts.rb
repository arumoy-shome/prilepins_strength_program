class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :area
      t.text :work 
      t.text :notes
      t.string :duration

      t.timestamps null: false
    end
  end
end
