# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'



5.times do
    User.create!(
        email: Faker::Internet.email,
        password: "password"
    )
end
users = User.all

5.times do
    Application.create!(
        User_id: users.sample.id,
        name: Faker::LordOfTheRings.character,
        URL: Faker::Internet.url
    )
end
applications = Application.all

5.times do
    Event.create!.event_params(
        application: applications.sample,
        event_name: Faker::LordOfTheRings.location,
        count: 5
    )
end
