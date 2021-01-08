# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Reservation.destroy_all

res1 = Reservation.create!(
  booking_code: "erf34erdf",
  from_date: "2021-01-01",
  to_date: "2021-01-01",
  property_id: "RF-8884-AK"
)

res2 = Reservation.create!(
  booking_code: "ersdfvc",
  from_date: "2021-01-01",
  to_date: "2021-01-01",
  property_id: "RF-8884-AK"
)

res3 = Reservation.create!(
  booking_code: "er34sdf",
  from_date: "2021-01-01",
  to_date: "2021-01-01",
  property_id: "RF-8884-AK"
)

puts "Added #{Reservation.count} reservations"

#==============================================================

Review.destroy_all

rev1 = Review.create!(
  comment: "amazing place to stay",
  rating: 4,
)

rev2 = Review.create!(
  comment: "Its not too bad",
  rating: 4,
)

rev3 = Review.create!(
  comment: "SuperB",
  rating: 5,
)

rev4 = Review.create!(
  comment: "Its fine",
  rating: 3,
)

puts "Added #{Review.count} reservations"

#==============================================================

User.destroy_all

user1 = User.create!(
  name:"David",
  email:"david@ga.co",
  password:"chicken"
)

user2 = User.create!(
  name:"John",
  email:"john@ga.co",
  password:"chicken"
)

user3 = User.create!(
  name:"Kyle",
  email:"Kyle@ga.co",
  password:"chicken"
)

user4 = User.create!(
  name:"Stacey",
  email:"Stacey@ga.co",
  password:"chicken"
)

puts "Added #{User.count} users"


#==============================================================
