# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: 'Nader',
  email: 'nader@example.com',
  password: '123456'
)

Recipe.create(
  title: 'my best recipe',
  descripton: 'italian dish',
  ingredients: 'tomato, potato',
  directions: 'put them tobether'
)
