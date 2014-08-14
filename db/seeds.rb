# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Video.create(name: "Family Guy", description: "Funny show", cover_image_url: "public/tmp/family_guy.jpg", title: "Family Guy", category_id: 2)
Video.create(name: "Futurama", description: "Really funny show", cover_image_url: "public/tmp/futurama.jpg", title: "Futurama", category_id: 1)
Video.create(name: "South Park", description: "Classic show", cover_image_url:"public/tmp/south_park.jpg", title:"South Park", category_id: 1)
monk = Video.create(name: "Monk", description: "Neurotic guy in SF, very funny",cover_image_url: "public/tmp/monk_large.jpg", title: "Monk", category_id: 1)
Video.create(name: "Family Guy", description: "Funny show", cover_image_url: "public/tmp/family_guy.jpg", title: "Family Guy", category_id: 2)
Video.create(name: "Futurama", description: "Really funny show", cover_image_url: "public/tmp/futurama.jpg", title: "Futurama", category_id: 1)
Video.create(name: "South Park", description: "Classic show", cover_image_url:"public/tmp/south_park.jpg", title:"South Park", category_id: 1)
Video.create(name: "Monk", description: "Neurotic guy in SF, very funny",cover_image_url: "public/tmp/monk_large.jpg", title: "Monk", category_id: 1)
Video.create(name: "Monk", description: "Neurotic guy in SF, very funny",cover_image_url: "public/tmp/monk_large.jpg", title: "Monk", category_id: 1)

Category.create(category_name: "Comedy", id: 1)
Category.create(category_name: "Drama", id: 2)

scott = User.create(full_name: "Scott IAMI", password: "password", email: "test@testmail.com")

Review.create(user: scott, video: monk, rating: 3, content: "This stuff rocks!")
Review.create(user: scott, video: monk, rating: 2, content: "Drivel, indubitably nothing but drivel")

