# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: 'Software')
Category.create(name: 'Hardware')
Category.create(name: 'Kleidung')

user = Admin.create(email: 'admin@example.de', password: '12345678', admin: 'true')
puts user.present?