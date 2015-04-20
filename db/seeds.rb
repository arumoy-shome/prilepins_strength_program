# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create sample users
Rake::Task['db:reset'].invoke
admin = User.create!(email: "arumoy.shome@gmail.com",
  password: "secret00",
  password_confirmation: "secret00",
  current_max: {bench: 185, squat: 275, deadlift: 315})
admin.toggle!(:admin)

99.times do |n|
User.create!(email: "example#{n+1}@user.com",
  password: "secret00",
  password_confirmation: "secret00")
end

User.all.limit(5).each do |user|
  50.times do
    user.posts.create!(content: Faker::Lorem.sentence(5))
  end
end
