# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firs
Order.destroy_all
User.destroy_all
Item.destroy_all

u = User.create()
i = u.items.create(name: "Ellen", price: 100)
# Item.create(name: "Ellen", price: 100, user: u)
o = Order.create(user_id: u.id, item_id: i.id)

# o = Order.create(user: u, item: i)
