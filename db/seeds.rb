# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

Reservation.destroy_all
res_array = []
20.times do |i|
  create = Reservation.create!(
    booking_code: 'er34d' + i.to_s,
    from_date: "2021-1-"+(1+i).to_s,
    to_date: "2021-2-"+(1+i).to_s,
  )
  res_array.push create
end

puts "Added #{Reservation.count} reservations"

#==============================================================

Review.destroy_all

reviews = ["amazing place to stay.","Its not too bad.","SuperB.","Its fine.","amazing place to stay.","Its not too bad.","SuperB.","Its fine.","amazing place to stay.","Its not too bad.","SuperB.","Its fine.","amazing place to stay.","Its not too bad.","SuperB.","Its fine.","amazing place to stay.","Its not too bad.","SuperB.","Its fine.","amazing place to stay.","Its not too bad.","SuperB.","Its fine.","amazing place to stay.","Its not too bad.","SuperB.","Its fine.","amazing place to stay.","Its not too bad.","SuperB.","Its fine."]

ratings = [4,2,3,4,3,4,2,3,4,3,4,2,3,4,3,4,2,3,4,3,4,2,3,4,3,4,2,3,4,3,4,2,3,4,3,4,2,3,4,3]

rev_array = []
20.times do |i|
  create = Review.create!(
    comment: reviews[i],
    rating: ratings[i],
  )
  rev_array.push create
end


puts "Added #{Review.count} reviews"

#==============================================================

User.destroy_all

user1 = User.create!(
  name:"David",
  email:"david@ga.co",
  password:"chicken",
  admin: true,
  about_info: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  email_confirmed: true,
  identity_confirmed: true

)

user2 = User.create!(
  name:"John",
  email:"john@ga.co",
  password:"chicken",
  about_info: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  email_confirmed: true,
  identity_confirmed: true
)

user3 = User.create!(
  name:"Kyle",
  email:"kyle@ga.co",
  password:"chicken",
  about_info: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  email_confirmed: true,
  identity_confirmed: true
)

user4 = User.create!(
  name:"Stacey",
  email:"stacey@ga.co",
  password:"chicken",
  about_info: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  email_confirmed: true,
  identity_confirmed: true
)

puts "Added #{User.count} users"

#==============================================================

Image.destroy_all

image_array = []
50.times do |i|
  create = Image.create!(
    name: "Name",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    image_url: i.to_s + ".jpg"
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
    heading: Faker::Movies::StarWars.quote,
    title: Faker::Movies::StarWars.character,
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


10.times do |i|
  res_array[i].reviews << rev_array[i] << rev_array[i+10]
end

####  UPDATED   ##################################

user1.reservations << Reservation.first << Reservation.second << Reservation.third << Reservation.fourth << Reservation.fifth

user2.reservations << Reservation.all[5] << Reservation.all[6] << Reservation.all[7] << Reservation.all[8] << Reservation.all[9]

user3.reservations << Reservation.all[10] << Reservation.all[11] << Reservation.all[12] << Reservation.all[13] << Reservation.all[14]

user4.reservations << Reservation.all[15] << Reservation.all[16] << Reservation.all[17] << Reservation.all[18] << Reservation.all[19]


# user1.reviews << Review.first << Review.second << Review.third << Review.fourth << Review.fifth << Review.all[10] << Review.all[11] << Review.all[12] << Review.all[13] << Review.all[14]
#
# puts "User #{user1.name} has the following review: #{user1.reviews.pluck(:id).join(", ")}"
#
# user2.reviews << Review.all[5] << Review.all[6] << Review.all[7] << Review.all[8] << Review.all[9] << Review.all[15] << Review.all[16] << Review.all[17] << Review.all[18] << Review.all[19]


puts "+++++++++++++++++++++"
puts "User #{user1.name} has the following reservations: #{user1.reservations.pluck(:booking_code).join(", ")}"
puts "User #{user2.name} has the following review: #{user2.reviews.pluck(:id).join(", ")}"
puts "Reservation #{Reservation.first.booking_code} has the following users: #{Reservation.first.users.pluck(:name).join(", ")}"
puts "+++++++++++++++++++++"



puts "User #{user1.name} has the following review: #{user1.reviews.pluck(:id).join(", ")}"
puts "User #{user2.name} has the following review: #{user2.reviews.pluck(:id).join(", ")}"
puts "User #{user3.name} has the following review: #{user3.reviews.pluck(:id).join(", ")}"
puts "User #{user4.name} has the following review: #{user4.reviews.pluck(:id).join(", ")}"


puts "++++++++++++++++++++++++"
puts "Review #{Review.first.comment} has the following reservation: #{Review.first.reservation.booking_code}"
puts "Resevation: #{Reservation.first.booking_code} has the following reviews: #{Reservation.first.reviews.pluck(:comment).join(", ")}"
puts "++++++++++++++++++++++++"


property_array[0].images << Image.all[0] << Image.all[1] << Image.all[2] << Image.all[3] << Image.all[4]

property_array[1].images << Image.all[5] << Image.all[6] << Image.all[7] << Image.all[8] << Image.all[9]

property_array[2].images << Image.all[10]<< Image.all[11] << Image.all[12] << Image.all[13] << Image.all[14]

property_array[3].images << Image.all[15] << Image.all[16] << Image.all[17] << Image.all[18] << Image.all[19]

property_array[4].images << Image.all[20] << Image.all[21] << Image.all[22] << Image.all[23] << Image.all[24]

property_array[5].images << Image.all[25] << Image.all[26] << Image.all[27] << Image.all[28] << Image.all[29]

property_array[6].images << Image.all[30] << Image.all[31] << Image.all[32] << Image.all[33] << Image.all[34]

property_array[7].images << Image.all[35] << Image.all[36] << Image.all[37] << Image.all[38] << Image.all[39]

property_array[8].images << Image.all[40] << Image.all[41] << Image.all[42] << Image.all[43] << Image.all[44]

property_array[9].images << Image.all[45] << Image.all[46] << Image.all[47] << Image.all[48] << Image.all[49]

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
