# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Reservation.destroy_all
res_array = []
20.times do |i|
  create = Reservation.create!(
    booking_code: 'er34d' + i.to_s,
    from_date: "2021-01-01",
    to_date: "2021-02-01",
  )
  res_array.push create
end

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

Image.destroy_all

image_array = []
50.times do |i|
  num = rand 1..10
  num = num.to_s
  create = Image.create!(
    name: "Name",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    image_url: "http://www.fillmurray.com/300/200"
  )
  image_array.push create
end

puts "Added #{Image.count} images"
#==============================================================

Property.destroy_all

property_array = [];
10.times do |i|
  num = rand 1..10
  num = num.to_s

  streets = ["104 Fairway Drive", "59 Brickmans Lane", "135 Vermont Road", "2 Surfleet Place", "6 Goodwin Road", "372 Old Northern Road", "7-9 Warners Avenue", "471 Captain Cook Drive", "156 Tallai Road", "1 Beatrice Terrace"]
  cities = ["Baulkham Hills", "Lovedale", "Mulbring", "Kiama", "Newport", "Castle Hill", "Willoughby","Woolooware", "Tallai", "Ascot"]
  states = [ "NSW", "NSW", "NSW", "NSW", "NSW", "NSW", "NSW", "NSW", "QLD", "QLD",]
  postcodes = ["2153", "2325", "2323", "2533", "2106", "2154", "2068", "2230", "4213", "4007"]
  types = ["apartment","house","hotel room","apartment","hotel room","apartment","house","hotel room","apartment","hotel room"]
  price = [80,60,50,120,70,100,90,75,95,80]
  amenities = [
    "Kitchen,
    First aid kit,
    Washing machine,
    Free parking on premises,
    Hangers,
    Iron,
    Hair dryer,
    Smoke alarm"
  ]

  create = Property.create!(
    heading: "Lorem ipsum dolor sit amet",
    title: "Lorem ipsum",
    address: cities[i] + ", " + states[i] + ", Australia",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    max_guests: 4,
    bedrooms: 3,
    bathrooms: 2,
    cleaning_fee: 200.00,
    service_fee: 100.00,
    street: streets[i],
    city: cities[i],
    state: states[i],
    postcode: postcodes[i],
    property_type: types[i],
    listing_price: price[i],
    amenities: amenities[0]
  )

  property_array.push create
end

puts "Added #{Property.count} propeties"
#==============================================================

user1.reservations << Reservation.first << Reservation.second << Reservation.third
user2.reservations << Reservation.first << Reservation.fourth
user3.reservations << Reservation.second

puts "+++++++++++++++++++++"
puts "User #{user1.name} has the following reservations: #{user1.reservations.pluck(:booking_code).join(", ")}"
puts "Reservation #{Reservation.first.booking_code} has the following users: #{Reservation.first.users.pluck(:name).join(", ")}"
puts "+++++++++++++++++++++"

Reservation.first.reviews << rev1
Reservation.second.reviews << rev2
Reservation.third.reviews << rev3

puts "++++++++++++++++++++++++"
puts "Review #{rev1.comment} has the following reservation: #{rev1.reservation.booking_code}"
puts "Resevation: #{Reservation.first.booking_code} has the following reviews: #{Reservation.first.reviews.pluck(:comment).join(", ")}"
puts "++++++++++++++++++++++++"

user1.reviews << rev5 << rev6
user2.reviews << rev7
user3.reviews << rev8

# Additional relationships for users and Reviews

user1.reviews << rev1 << rev2 << rev3
user4.reviews << rev4

##################################################

puts "++++++++++++++++++++++++"
puts "Review #{rev5.comment} has the following user: #{rev5.user.name}"
puts "User: #{user1.name} has the following reviews: #{user1.reviews.pluck(:comment).join(", ")}"
puts "++++++++++++++++++++++++"

puts "++++++++++++++++++++++++"

10.times do |i|
  property_array[i].images << image_array[i] << image_array[i+10] << image_array[i+20] << image_array[i+30] << image_array[i+40]
end

puts "Testing property -< images associations:"
puts "The image '#{ Image.first.name }' is by"
puts Image.first.property.street
puts "The property #{ Property.last.street} has the images: #{ Property.last.images.pluck(:name).join(', ') }"

puts "++++++++++++++++++++++++"
10.times do |i|
  property_array[i].reservations << res_array[i] << res_array[i+10]
end

puts "Testing property -< reservations associations:"
puts "The reservation '#{ Reservation.first.booking_code }' is by"
puts Reservation.first.property.title
puts "The property #{ Property.last.street} has the resevations: #{ Property.last.reservations.pluck(:booking_code).join(', ') }"
puts "++++++++++++++++++++++++"
