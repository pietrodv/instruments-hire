# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'music_faker'

Booking.destroy_all
Instrument.destroy_all
Category.destroy_all
User.destroy_all

p 'Cleaning DB'

# Set real addresses from array
addresses = ['Rua Rodrigues Sampaio 172, Lisboa', 'Rua Escola do Exército 5A, Lisboa' , 'São Jorge de Arroios, Lisbon', 'Rua João Penha 2-14, Lisboa', 'Rua Damasceno Monteiro 74-152, Lisboa', 'Rua Manuel Soares Guedes 1, Lisboa', "Rua de Sant'Ana à Lapa 2-52, Lisboa", 'Rua do Patrocínio 55-1, Lisboa', 'Rua de Borges Carneiro 57, Lisboa', 'Rua Vítor Cordon 24-40, Lisboa']

10.times do
  User.create!(first_name: Faker::Name.unique.first_name, last_name: Faker::Name.unique.last_name, bio: Faker::Lorem.paragraphs.join(" "), address: addresses.sample, email: Faker::Internet.email, password: Faker::Alphanumeric.alphanumeric(number: 10))
end

#create users with email-psw we know
User.create!(first_name: 'John', last_name: 'Smith', email: 'johnsmith@lewagon.com', password: 'abcd123')
User.create!(first_name: 'Anna', last_name: 'Smith', email: 'annasmith@lewagon.com', password: 'abcd123')

p 'Users created'
a = Category.new(name: '...others')
a.save
b = Category.new(name: 'Electric Guitars')
b.save
c = Category.new(name: 'Acoustic Guitars')
c.save
d = Category.new(name: 'Violins')
d.save
e = Category.new(name: 'Drums')
e.save
f =Category.new(name: 'Pianos')
f.save
g = Category.new(name: 'Bass Guitars')
g.save
h = Category.new(name: 'Winds')
h.save
i = Category.new(name: 'Mics')
i.save
j = Category.new(name: 'Strings')
j.save
k = Category.new(name: 'Percussions')
k.save
p 'Category created'



12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = b
  instrument.save
end

12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = c
  instrument.save
end

12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = a
  instrument.save
end

12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = d
  instrument.save
end

12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = e
  instrument.save
end

12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = f
  instrument.save
end

12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = g
  instrument.save
end

12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = h
  instrument.save
end

12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = i
  instrument.save
end
12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = j
  instrument.save
end
12.times do
  instrument = Instrument.new(name: MusicFaker::Instrument.name.split[0...-1].join(' '), details: Faker::Lorem.paragraphs.join(" "), price_per_day: Faker::Number.decimal(l_digits: 2))
  instrument.user = User.all.sample
  instrument.category = k
  instrument.save
end

p 'Instrument created'
