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
