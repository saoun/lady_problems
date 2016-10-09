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

Post.destroy_all
Board.destroy_all
Pitch.destroy_all
User.destroy_all

10.times do
User.create([
  { name: Faker::Name.name,
    uid: rand(1235),
    provider: providerArr[rand(4)],
    email: Faker::Internet.email,
    bio: Faker::Lorem.sentence,
    img: Faker::Avatar.image,
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


  boardCatergoryArr =  ["Jobs", "Internships", "Projects", "Funding"]

  Board.create([
    owners: "#{rand(10)}",
    category: boardCatergoryArr[rand(4)],
    title: Faker::Hacker.say_something_smart
  ])


end

10.times do


  pitchCategoryArr = ["Social Justice", "Networking", "Consumer Products"]
  pitchLookingForArr = ["UI/UX Design", "Developers", "Mentorship", "Support"]

  Pitch.create([
    title: Faker::Hipster.sentence(5),
    description:Faker::Hipster.sentences(1),
    category:pitchCategoryArr[rand(3)],
    looking_for:pitchLookingForArr[rand(4)],
    user_id: User.first.id
  ])
end


puts "Created #{User.count} Users"
puts "Created #{Board.count} boards"
puts "Created #{Pitch.count} pitches"
