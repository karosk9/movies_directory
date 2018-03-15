# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

15.times do
  Movie.create(
    title: Faker::SiliconValley.invention,
    duration: Faker::Number.between(20, 240),
    description: Faker::Lorem.paragraphs,
    country: Faker::Address.country,
    movie_types: Faker::Book.genre,
    date_of_premiere: Faker::Number.between(1918, 2019),
    director: Faker::StarWars.character
  )
end

puts "#{Movie.all.count} movies created!"

15.times do
  User.create(
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

puts "#{User.all.count} users created"
