require 'open-uri'
require 'faker'
require 'date'

puts 'Creating main user...'
sleep(1)

main_user = User.create!(first_name: 'Ed',
                         last_name: 'Colen',
                         username: 'edcolen',
                         email: 'ed.colen@gmail.com',
                         password: '123456')

# avatar_url = "https://api.adorable.io/avatars/285/#{main_user.id}projecttracker.png"
# avatar = URI.open(avatar_url)
# main_user.photo.attach(io: avatar, filename: "#{main_user.username}.png", content_type: 'image/png')
puts "#{main_user.username} created"

puts 'Creating other users...'
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

  # avatar_url = "https://api.adorable.io/avatars/285/#{user.id}projecttracker.png"
  # avatar = URI.open(avatar_url)
  # user.photo.attach(io: avatar, filename: "#{user.username}.png", content_type: 'image/png')
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
  project_user_id = User.all.sample.id
  project_title = Faker::TvShows::Seinfeld.quote
  project_description = Faker::Quote.famous_last_words
  project_start_date = Date.today.prev_day(rand(8..20))
  project_end_date = Date.today.next_day(rand(20..45))
  Project.create!(user_id: project_user_id,
                  title: project_title,
                  description: project_description,
                  start_date: project_start_date,
                  end_date: project_end_date)
  puts "Project #{project.title} created"
end

puts 'Creating collaborations...'
sleep(1)

project_id = Project.all.sample.id
user_id = project_id.user.id
member_id = User.all.sample.id
role = %w[admin developer designer developer designer].sample

collaboration = Collaboration.create!(user_id: user_id,
                                      member_id: member_id,
                                      project_id: project_id,
                                      role: role)
puts "Assigned #{collaboration.member_id.username} to project: '#{collaboration.project_id.title}'"

puts 'Creating project sections...'
sleep(1)

puts 'Creating cards...'
sleep(1)

puts 'Creating comments...'
sleep(1)

puts 'Creating responses...'
sleep(1)

puts 'Seed successfully created!!!!'
