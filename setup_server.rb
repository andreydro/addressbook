puts "---MAKING BUNDLE INSTALL---"
system("bundle install")
puts "---BUNDLE INSTALLED---"

puts "---CREATING DB---"
system("rake db:create")
puts "---DB CREATED---"

puts "---MIGRATING DB---"
system("rake db:migrate")
puts "---DB MIGRATED---"

puts "---SEEDING DB---"
system("rake db:seed")
puts "---DB SEEDED---"

puts "---SERVER IS STARTING---"
system("shotgun")
