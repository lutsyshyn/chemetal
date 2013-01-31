# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name:"admin")
Role.create(name:"author")
Role.create(name:"editor")
User.create(email:"salo@salo.com", password:"password", password_confirmation:"password")
User.find(1).update_attributes(role_ids: [1])
User.create(email:"author@salo.com", password:"password", password_confirmation:"password")
User.create(email:"editor@salo.com", password:"password", password_confirmation:"password")
User.find(3).update_attributes(role_ids: [3])
Journal.create(volume: "1", year:"2008", issue:"1/2", pages: "1-150", month:"March")


