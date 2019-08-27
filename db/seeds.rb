# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all

users = 10.times do
  User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, email: Faker::Internet.email, password: Faker::Alphanumeric.alphanumeric(number: 10))
end

User.create!(first_name: 'John', last_name: 'Smith', email: 'johnsmith@lewagon.com', password: 'abcd123')
User.create!(first_name: 'Anna', last_name: 'Smith', email: 'annasmith@lewagon.com', password: 'abcd123')

30.times do
  instrument = Instrument.new(name: Faker::Music.instrument)
  instrument.user = User.all.sample
  instrument.save
end
