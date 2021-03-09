# This file should contain all the record creation needed to  database with its default values.
# The data can then be loaded with the rails db:mand (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Property.destroy_all
Reservation.destroy_all

#FAKING USERS
require 'faker'
puts 'Creating 30 fake users...'
30.times do
  users = User.new(
    name:  Faker::Name.name,
    email: Faker::Internet.email,
    password: "123456"
  )
  users.save!
end
puts 'Finished!'


#FAKING CASTLES
=begin
puts 'Creating 100 fake castles...'
100.times do
  properties = Property.new(
    name:  "Chateau #{Faker::Company.name}",
    location: Faker::Address.full_address,
    price: Faker::Number.number(digits: 5),
    photo: "https://picsum.photos/1400/500",
    users_id: 3
  )
  properties.save!
end
puts 'Finished!'
=end