# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@user = User.find_or_create_by(email: "jwt@example.com", password_hash: "jwt123")
Post.create(title: "To Buy a good house", user_id: @user.id)
Post.create(title: "To Travel the world", user_id: @user.id)
Post.create(title: "To Write a beautiful code", user_id: @user.id)
