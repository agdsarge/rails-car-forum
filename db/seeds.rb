# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Post.destroy_all
User.destroy_all


pn = User.create(first_name: "Paul", last_name: "Nicholsen", username: "pnicholsen", email: "pnicholsen@flatiron.com", bio: "I am an instructor at Flatiron School. I like cats.", zip: 12345, password: 'password')
sn = User.create(first_name: "Shannon", last_name: "Nabors", username: "snabors", email: "snabors@flatiron.com", bio: "I am a software coach at Flatiron School, I like flags.", zip: 54321, password: 'password')
ad = User.create(first_name: "Ann", last_name: "Duong", username: "aduong", email: "aduong@flatiron.com", bio: "I am an instructor at Flatiron School, I like Pokemon.", zip: 34251, password: 'password')
ck = User.create(first_name: "Chine", last_name: "Anikwe", username: "canikwe", email: "canikwe@flatiron.com", bio: "I am a former software coach at Flatiron School, I like leaving and abandoning people.", zip: 13542, password: 'password')

first_post = Post.create(body: "I have this excellent car, and I just wanted to brag about it.", picture: "https://i.pinimg.com/originals/36/a7/c8/36a7c8ac9a4d58e3c37543b07dd5979b.jpg", user: pn)
second_post = Post.create(body: "I like a good Camaro, because I can get away fast", picture: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2019-chevrolet-camaro-zl1-1le-comparison-105-1581425382.jpg?crop=0.825xw:0.620xh;0.147xw,0.356xh&resize=1200:*', user: ck)

Comment.create(body: "You're very strange, Paul.", user: sn, post: first_post)
Comment.create(body: "I like the Pikachu car more", picture: "https://i.redd.it/9d1khmlnj5r21.jpg", user: ad, post: first_post)
Comment.create(body: "You are also strange, Ann.", user: pn, post: first_post)

Comment.create(body: "Have fun with your new friends", user: sn, post: second_post)
