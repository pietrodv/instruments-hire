# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all

# Set real addresses from array
addresses = ['Rua Rodrigues Sampaio 172, Lisboa', 'Rua Escola do Exército 5A, Lisboa' , 'São Jorge de Arroios, Lisbon', 'Rua João Penha 2-14, Lisboa', 'Rua Damasceno Monteiro 74-152, Lisboa', 'Rua Manuel Soares Guedes 1, Lisboa', "Rua de Sant'Ana à Lapa 2-52, Lisboa", 'Rua do Patrocínio 55-1, Lisboa', 'Rua de Borges Carneiro 57, Lisboa', 'Rua Vítor Cordon 24-40, Lisboa']

10.times do
  User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, bio: Faker::Lorem.paragraphs.join(" "), address: addresses.sample, email: Faker::Internet.email, password: Faker::Alphanumeric.alphanumeric(number: 10))
end

#create users with email-psw we know
User.create!(first_name: 'John', last_name: 'Smith', email: 'johnsmith@lewagon.com', password: 'abcd123')
User.create!(first_name: 'Anna', last_name: 'Smith', email: 'annasmith@lewagon.com', password: 'abcd123')

15.times do
  instrument = Instrument.new(name: Faker::Music.instrument, details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.save
end
