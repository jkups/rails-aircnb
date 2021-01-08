# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Reservation.destroy_all

res1 = Reservation.create!(
  booking_code: "er34df",
  from_date: "2021-01-01",
  to_date: "2021-01-01",
  property_id: "RF-8884-AK"
)

res2 = Reservation.create!(
  booking_code: "erdfvc",
  from_date: "2021-01-01",
  to_date: "2021-01-01",
  property_id: "RF-8884-AK"
)

res3 = Reservation.create!(
  booking_code: "er34sd",
  from_date: "2021-01-01",
  to_date: "2021-01-01",
  property_id: "RF-8884-AK"
)
res4 = Reservation.create!(
  booking_code: "er23w3",
  from_date: "2021-01-01",
  to_date: "2021-01-01",
  property_id: "RF-8884-AK"
)

puts "Added #{Reservation.count} reservations"

#==============================================================

Review.destroy_all

rev1 = Review.create!(
  comment: "amazing place to stay.",
  rating: 4,
)

rev2 = Review.create!(
  comment: "Its not too bad.",
  rating: 4,
)

rev3 = Review.create!(
  comment: "SuperB.",
  rating: 5,
)

rev4 = Review.create!(
  comment: "Its fine.",
  rating: 3,
)

rev5 = Review.create!(
  comment: "Great customer.",
  rating: 4,
)

rev6 = Review.create!(
  comment: "Horrible Customer.",
  rating: 1,
)

rev7 = Review.create!(
  comment: "Did not make beds when they left, otherwise they were ok.",
  rating: 3,
)

rev8 = Review.create!(
  comment: "Left the place better then they found it.",
  rating: 5,
)

puts "Added #{Review.count} reviews"

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
  email:"kyle@ga.co",
  password:"chicken"
)

user4 = User.create!(
  name:"Stacey",
  email:"stacey@ga.co",
  password:"chicken"
)

puts "Added #{User.count} users"


#==============================================================

user1.reservations << res1 << res2 << res3
user2.reservations << res1 << res4
user3.reservations << res2

puts "+++++++++++++++++++++"
puts "User #{user1.name} has the following reservations: #{user1.reservations.pluck(:booking_code).join(", ")}"
puts "Reservation #{res1.booking_code} has the following users: #{res1.users.pluck(:name).join(", ")}"
puts "+++++++++++++++++++++"

res1.reviews << rev1 << rev4
res2.reviews << rev2
res3.reviews << rev3

puts "++++++++++++++++++++++++"
puts "Review #{rev1.comment} has the following reservation: #{rev1.reservation.booking_code}"
puts "Resevation: #{res1.booking_code} has the following reviews: #{res1.reviews.pluck(:comment).join(", ")}"
puts "++++++++++++++++++++++++"

user1.reviews << rev5 << rev6
user2.reviews << rev7
user3.reviews << rev8

# puts "++++++++++++++++++++++++"
# puts "Review #{rev5.comment} has the following user: #{rev5.user.name}"
# puts "User: #{user1.name} has the following reviews: #{user1.reviews.pluck(:comment).join(", ")}"
# puts "++++++++++++++++++++++++"
