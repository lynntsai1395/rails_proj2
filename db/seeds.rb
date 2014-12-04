# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

john = User.create(email: 'john@example.com', password: 'hunter2~')
question = Question.create(user: john, title: 'Calculate the nth fibonacci number.', content: 'Given an input integer `n`, return the `n`-th fibonacci number.')
