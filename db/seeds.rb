# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

providerArr = ["Twitter", "LinkedIn", "GitHub", "Facebook"]

arrOfTruth = [true, false]

User.delete_all

10.times do
User.create([
  { name: Faker::Name.name,
    uid: rand(1235),
    provider: providerArr[rand(4)],
    email: Faker::Internet.email,
    bio: Faker::Lorem.sentence,
    img: Faker::Avatar.image,
    email:Faker::Internet.email,
    location: Faker::Address.city,
    area_of_interest: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
    years_of_expertise: Faker::Number.number(1),
    past_employment: Faker::Company.name,
    twitter_link: Faker::Internet.url,
    linked_in_link: Faker::Internet.url,
    github_link: Faker::Internet.url,
    facebook_link: Faker::Internet.url,
    admin: false,
    web_developer: arrOfTruth[rand(2)],
    project_mgmt: arrOfTruth[rand(2)],
    marketing: arrOfTruth[rand(2)],
    ux_ui: arrOfTruth[rand(2)],
    data_analytics: arrOfTruth[rand(2)],
    human_resources: arrOfTruth[rand(2)],
    finance: arrOfTruth[rand(2)],
    business_development: arrOfTruth[rand(2)],
    other: Faker::Hacker.ingverb
  }
])
end


puts "Created #{User.count} Users"
