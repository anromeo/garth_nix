# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(email: "user@gmail.com", password: "password")

universe = Universe.create(title: "The Old Kingdom", description: "Blah, blah!")

book = Book.create(title: "Abhorsen", description: "Best Book Ever", publisher: "Harper Collins")

question = Question.create(name: "Anthony", q: "Will you read my book?", a: "Of course!")