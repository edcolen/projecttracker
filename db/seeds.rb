require 'open-uri'
require 'faker'
require 'date'

puts 'Creating users...'
sleep(1)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = Faker::Internet.username(specifier: "#{first_name} #{last_name}", separators: %w[. _ -])
  email = Faker::Internet.free_email(name: username)
  password = '123456'
  user = User.create!(first_name: first_name,
                      last_name: last_name,
                      username: username,
                      email: email,
                      password: password)

  avatar_url = "https://api.adorable.io/avatars/285/#{user.id}projecttracker.png"
  avatar = URI.open(avatar_url)
  user.photo.attach(io: avatar, filename: "#{user.username}.png", content_type: 'image/png')
  puts "#{user.username} created"
end

puts 'Creating colors...'
sleep(1)

color_counter = 0
5.times do
  color_names = %w[red green blue pink gray]
  color_hexcodes = %w[#ff937c #bfff90 #b6f8ff #fbb6ff #d9d9d9]
  color = Color.create!(name: color_names[counter], hexcode: color_hexcodes[counter])
  color_counter += 1
  puts "Color #{color.name} created"
end

puts 'Creating tags...'
sleep(1)

15.times do
  tag_name = Faker::Lorem.word
  tag = Tag.create!(name: tag_name)
  puts "Tag #{tag.name} created"
end

puts 'Creating projects...'
sleep(1)

3.times do
  project_user_id = User.all.sample
  project_title = Faker::TvShows::Seinfeld.quote
  project_description = Faker::Quote.famous_last_words
  project_start_date
  project_end_date
end

puts 'Creating sections...'
sleep(1)

puts 'Creating cards...'
sleep(1)

puts 'Creating comments...'
sleep(1)

puts 'Creating responses...'
sleep(1)

puts 'Seed successfully created!!!!'
