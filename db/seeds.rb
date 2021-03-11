# This file should contain all the record creation needed to  database with its default values.
# The data can then be loaded with the rails db:mand (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all if Rails.env.development?
Property.destroy_all if Rails.env.development?
Reservation.destroy_all if Rails.env.development?

#FAKING USERS
require 'faker'
puts 'Creating 5 fake users...'
5.times do
  users = User.new(
    name:  Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  users.save!
end
puts 'Finished!'


#FAKING CASTLES

puts 'Creating 5 fake castles...'
user1 = User.last
5.times do
  properties = Property.new(
    name:  "Chateau #{Faker::Company.name}",
    address: Faker::Address.full_address,
    price: Faker::Number.number(digits: 5),
    photo: "https://picsum.photos/1400/500",
    user_id: user1.id
  )
 properties.save!
end
puts 'Finished!'
