# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
puts "destroyed all messages"
User.destroy_all
puts "destroyed all users"
Channel.destroy_all
puts "destroyed all channels"

general = Channel.create(name: 'general')
paris = Channel.create(name: 'paris')
react = Channel.create(name: 'react')

seb = User.create(email: 'seb@lewagon.com', password: 'motdepasse')
puts seb
romain = User.create(email: 'romain@lewagon.com', password: 'motdepasse')
puts romain
boris = User.create(email: 'boris@lewagon.com', password: 'motdepasse')
puts boris


Message.create({user: seb, channel: general, content: "seb is testing the general channel"})
Message.create({user: romain, channel: react, content: "romain is testing the react channel"})
Message.create({user: boris, channel: paris, content: "boris is testing the paris channel"})
