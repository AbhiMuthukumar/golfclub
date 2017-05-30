# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Club.create(name: 'Rosedale Golf Club');
Club.create(name: 'GTA Golf Club');
Club.create(name: 'Ladies Golf Club of Toronto');
Club.create(name: 'Flemingdon Park Golf Club');
Club.create(name: 'Lambton Golf & Country Club');
Club.create(name: 'Bayview Golf and Country Club');

puts "Seeding Success!"
