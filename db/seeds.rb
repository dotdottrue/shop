# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(name: 'Weißbrot')
Category.create!(name: 'Körner')
Category.create!(name: 'Brötchen')

ShippingMethod.create(name: 'Standard', duration: '3 Tage', price: 3.50, vat_rate: 7)
ShippingMethod.create(name: 'Expresslieferung', duration: '1 Tag',price: 8.50, vat_rate: 7)
ShippingMethod.create(name: 'Abholung', duration: 'Dauer bis zur Abholung', price: 0, vat_rate: 7)

User.create!(email: 'admin@dotdottrue.com', password: 'admin678', firstname: 'Administrator', admin: true)

categories = Category.all

for i in 1..50
  product = Product.new(name: "Test #{i}", description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit ame', short_description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l', vat_rate: 7, price: Random.rand(100))
  product.avatar_remote_url('http://lorempixel.com/400/200/')
  product.categories << categories[Random.rand(categories.count)]
  product.save
end

