# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create({email: "test1@gmail.com", password:"111111", name:"Steph Curry", address:"Daly City, CA"})
user2 = User.create({email: "test2@gmail.com", password:"111111", name:"Kevin Durant", address:"Oakland, CA"})
user3 = User.create({email: "test3@gmail.com", password:"111111", name:"Klay Thompson", address:"San Francisco, CA"})

truck1 = Truck.create({name: "Taco Guys", menu: "Tacos", hours: "10am-3pm", location: "24 Willie Mays Plaza, San Francisco, CA 94107", user_id: user1.id })
truck2 = Truck.create({name: "Pizza Guys", menu: "Pizza", hours: "11am-2pm", location: "225 Bush St. San Francisco, CA 94104", user_id: user1.id })
truck3 = Truck.create({name: "Boba Guys", menu: "Boba for days!", hours: "10am-4pm", location: "800 Market St, San Francisco, CA 94103", user_id: user1.id })

truck4 = Truck.create({name: "Bibimbap Guys", menu: "Bibimbap!", hours: "10am-4pm", location: "801 Market St, San Francisco, CA 94103", user_id: user1.id })
