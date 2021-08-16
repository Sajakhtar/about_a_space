# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

puts "Cleaning database..."
User.destroy_all
# Space.destroy_all
# Booking.destroy_all
# Review.destroy_all

puts "Creating Spaces..."


users = [
  {first_name: 'John', last_name: 'Doe', email: 'john@gmail.com', password: '123456'},
  {first_name: 'Jane', last_name: 'Doe', email: 'jane@gmail.com', password: '123456'},
  {first_name: 'Jon', last_name: 'Snow', email: 'jon@gmail.com', password: '123456'},
  {first_name: 'Jack', last_name: 'Jones', email: 'jack@gmail.com', password: '123456'},
  {first_name: 'Joe', last_name: 'Blogs', email: 'joe@gmail.com', password: '123456'},
  {first_name: 'David', last_name: 'Smith', email: 'david@gmail.com', password: '123456'},
  {first_name: 'Jenny', last_name: 'Smith', email: 'jenny@gmail.com', password: '123456'},
  {first_name: 'Jamey', last_name: 'Johnson', email: 'jamey@gmail.com', password: '123456'}
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

titles = {
  'Office' => ['Office with sea views', 'Office overlooking the Dubai Marina', 'Office with Burj views', 'Downtown Modern Office', 'Modern Office in central location', 'Office Space in Central Dubai'],
  'Conference Room' => ['Conference Room with sea views', 'Conference Room overlooking the Dubai Marina', 'Conference Room with Burj views', 'Downtown Modern Conference Room', 'Modern Conference Room in central location', 'Conference Room in Central Dubai'],
  'Hall' => ['Events hall with sea views', 'Events hall overlooking the Dubai Marina', 'Events hall with Burj views', 'Downtown Modern Events hall', 'Modern Events hall in central location', 'Events hall in Central Dubai']
}


descriptions = {
  'Office' => 'A brightly lit office space, with large desks and egonomic chairs. Each work station has power sockets and USB charging port. A pantry with a dining and free tea and coffee is avaible for all guests',
  'Conference Room' => 'A spacious and brighly lit conference room that can be used for board meatings, team meetings workshops and a collaborative environment. Ameneties include a conference calling suite, multiple power sockets, white boards and marker pens',
  'Hall' => 'A spacious hall available for events, functions, conferences, weddings, parties. The hall has flexible a layouts to suit any kind of event. Tables and chairs available from a self-service storage room.'
}

capacities = {
  'Office' => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  'Conference Room' => [4, 6, 8, 10, 12, 14, 16, 18, 20],
  'Hall' => [50, 100, 150, 200, 250, 300, 400, 500, 750, 1000, 2000]
}

prices = {
  'Office' => [200, 225, 250, 275, 300, 325, 350, 400, 425, 500, 525],
  'Conference Room' => [200, 225, 250, 275, 300, 325, 350, 400, 425, 500, 525],
  'Hall' => [500, 750, 1000, 2000, 2500, 3000, 4000]
}

wifi = [true, false]

photos = {
  'Office' => ['office4', 'office5', 'office6'],
  'Conference Room' => ['conference_room4', 'conference_room5', 'conference_room6'],
  'Hall' => ['hall4', 'hall5', 'hall6']
}
path = '/Users/sajakhta/Downloads/photos/'
extension = '.jpeg'

photos_urls = {
  'Office' => [
    'https://images.unsplash.com/photo-1504384308090-c894fdcc538d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1604328698692-f76ea9498e76?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80'
  ],
  'Conference Room' => [
    'https://images.unsplash.com/photo-1497366811353-6870744d04b2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1582653291997-079a1c04e5a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1503423571797-2d2bb372094a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1567&q=80'
  ],
  'Hall' => [
    'https://images.unsplash.com/photo-1604081123441-90fb590beb80?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3352&q=80',
    'https://images.unsplash.com/photo-1542665952-14513db15293?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=3300&q=80',
    'https://images.unsplash.com/photo-1598242930255-c25f98ff11e5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1997&q=80'
  ]
}


space_types = ['Office', 'Conference Room', 'Hall']



users.each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.email}"
  space_types.each do |space_type|
    attributes = {
      space: space_type,
      title: titles[space_type].sample,
      description: descriptions[space_type],
      address: addresses.sample,
      price: prices[space_type].sample,
      capacity: capacities[space_type].sample,
      wifi: wifi.sample,
      user: user
    }
    space = Space.create!(attributes)

    # attach local photo files
    # photos[space_type].each do |photo|
    #   space.photos.attach(io: File.open("#{path}#{photo}#{extension}"), filename: "#{photo}#{extension}", content_type: 'image/jpeg')
    # end

    # attach URL photo files
    photos_urls[space_type].each_with_index do |url, index|
      file = URI.open(url)
      space.photos.attach(io: file, filename: "#{space_type}#{index}.jpeg", content_type: 'image/jpeg')
    end



    puts space.title
  end
end

puts "Finished!"
