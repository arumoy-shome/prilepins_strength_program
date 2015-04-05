namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(email: "arumoy.shome@gmail.com",
      password: "secret00",
      password_confirmation: "secret00")
    admin.toggle!(:admin)

    99.times do |n|
    User.create!(email: "example#{n+1}@user.com",
      password: "secret00",
      password_confirmation: "secret00")
    end
  end
end
