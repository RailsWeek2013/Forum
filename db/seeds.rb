# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


rand(2..5).times do |x|
	topic = Topic.create({
		name: "Topic#{x}"
	})

	rand(5..10).times do |y|
		userThread = topic.userThreads.create({
			title: "UserThread#{y}"
		})

		rand(5..10).times do |z|
			userThread.posts.create({
				title: "Post#{z}",
				content: "TestText#{z}",
				spam: false,
				rating: 5
			})
		end
	end
end
