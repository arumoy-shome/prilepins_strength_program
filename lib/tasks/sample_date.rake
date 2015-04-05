require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    User.create!(email: "arumoy.shome@gmail.com",
      password: "secret00",
      password_confirmation: "secret00")
    99.times do |n|
    User.create!(email: "example#{n+1}@user.com",
      password: "secret00",
      password_confirmation: "secret00")
    end
  end
end
