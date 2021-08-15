# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."
User.destroy_all
# Space.destroy_all
# Booking.destroy_all
# Review.destroy_all

puts "Creating Spaces..."


users = [
  {first_name: 'John', last_name: 'Doe', email: 'john@gmail.ocm', password: '123456'},
  {first_name: 'Jane', last_name: 'Doe', email: 'jane@gmail.ocm', password: '123456'},
  {first_name: 'Jon', last_name: 'Snow', email: 'jon@gmail.ocm', password: '123456'},
  {first_name: 'Jack', last_name: 'Jones', email: 'jack@gmail.ocm', password: '123456'},
  {first_name: 'Joe', last_name: 'Blogs', email: 'joe@gmail.ocm', password: '123456'},
  {first_name: 'David', last_name: 'Smith', email: 'david@gmail.ocm', password: '123456'},
  {first_name: 'Jenny', last_name: 'Smith', email: 'jenny@gmail.ocm', password: '123456'}
]


addresses = [
  'Manazel Al Safa Tower, Sheikh Zayed Road, Dubai, UAE',
  'Indigo Icon Tower, Cluster F, Jumeirah Lakes Towers, Dubai',
  'Building 19, Dubai Knowledge Park, King Salman Bin Abdulaziz Al Saud St, Al Sufouh, Al Sufouh 2, Dubai',
  'Publicis Media, Dubai Properties HQ, Al Falak St, 5th Floor, Dubai',
  'Address Dubai Marina, 66 Al Marsa St, Dubai Marina, Dubai',
  'Four Points by Sheraton Sheikh Zayed Road, Sheikh Zayed Rd, Trade CentreTrade Centre 1, Dubai',
  'Al Batha Tower Business Bay, 216 Sheikh Zayed Rd, Business Bay, Dubai',
  'Five Palm Residences, Palma Jumeirah - The Palm Jumeirah - Dubai',
  'GE Building 18, Dubai Media City, Dubai',
  'Marina Plaza, Dubai Marina, Dubai'
]


descriptions = {
  'Office': 'A brightly lit office space, with large desks and egonomic chairs. Each work station has power sockets and USB charging port. A pantry with a dining and free tea and coffee is avaible for all guests',
  'Conference Room': 'A spacious and brighly lit conference room that can be used for board meatings, team meetings workshops and a collaborative environment. Ameneties include a conference calling suite, multiple power sockets, white boards and marker pens',
  'Hall': 'A spacious hall available for events, functions, conferences, weddings, parties. The hall has flexible a layouts to suit any kind of event. Tables and chairs available from a self-service storage room.'
}


spaces = ['Office', 'Conference Room', 'Hall']

# Create 3 spaces per user

path = ''
extentsion = '.jpeg'
space = {
  space: 'Light & Spacious Garden Flat London',
  title: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  address: 75,
  price: 3,
  capacity: '',
  wifi: '',
  photos: ''
}

offices = ['/office', '/office2', '/office3']
conference_room = ['/conference_room', '/conference_room2', '/conference_room3']
halls = ['/hall','/hall2','/hall3']

# Iterate through 4 Users
  # create a user
  # 3.times do Create 3 spaces per user
  # create Space
    # sample from addresses
    # take relevant space images



users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.email}"
end

puts "Finished!"
