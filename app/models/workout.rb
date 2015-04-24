class Workout < ActiveRecord::Base
  serialize :work
  belongs_to :user
end
