require 'open-uri'
require 'faker'
require 'date'

puts 'Creating main user...'
sleep(1)

main_user = User.create!(
  first_name: 'Ed',
  last_name: 'Colen',
  username: 'edcolen',
  email: 'ed.colen@gmail.com',
  password: '123456'
)
puts "#{main_user.username} created"
# avatar_url = "https://api.adorable.io/avatars/285/#{main_user.id}projecttracker.png"
# avatar = URI.open(avatar_url)
# main_user.photo.attach(io: avatar, filename: "#{main_user.username}.png", content_type: 'image/png')

puts 'Creating other users...'
sleep(1)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  username = Faker::Internet.username(specifier: "#{first_name} #{last_name}", separators: %w[. _ -])
  email = Faker::Internet.free_email(name: username)
  password = '123456'
  user = User.create!(
    first_name: first_name,
    last_name: last_name,
    username: username,
    email: email,
    password: password
  )
  puts "#{user.username} created"
  # avatar_url = "https://api.adorable.io/avatars/285/#{user.id}projecttracker.png"
  # avatar = URI.open(avatar_url)
  # user.photo.attach(io: avatar, filename: "#{user.username}.png", content_type: 'image/png')
end

puts 'Creating colors...'
sleep(1)

color_counter = 0
5.times do
  color_names = %w[red green blue pink gray]
  color_hexcodes = %w[#ff937c #bfff90 #b6f8ff #fbb6ff #d9d9d9]

  color = Color.create!(
    name: color_names[color_counter],
    hexcode: color_hexcodes[color_counter]
  )
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

puts 'Creating main project...'
sleep(1)

project_user_id = User.first.id
project_title = Faker::TvShows::Seinfeld.quote
project_description = Faker::Quote.famous_last_words
project_start_date = Date.today.prev_day(rand(8..20))
project_end_date = Date.today.next_day(rand(20..45))
project = Project.create!(
  user_id: project_user_id,
  title: project_title,
  description: project_description,
  start_date: project_start_date,
  end_date: project_end_date
)
puts "Project #{project.title} created"

puts 'Creating other projects...'
sleep(1)

3.times do
  project_user_id = User.all.sample.id
  project_title = Faker::TvShows::Seinfeld.quote
  project_description = Faker::Quote.famous_last_words
  project_start_date = Date.today.prev_day(rand(8..20))
  project_end_date = Date.today.next_day(rand(20..45))

  project = Project.create!(
    user_id: project_user_id,
    title: project_title,
    description: project_description,
    start_date: project_start_date,
    end_date: project_end_date
  )
  puts "Project #{project.title} created"
end

puts 'Creating privileges for main project...'
sleep(1)

privilege_user_id = User.first.id
privilege_admin_id = User.first.id
privilege_project_id = Project.first.id

privilege = Privilege.create!(
  user_id: privilege_user_id,
  admin_id: privilege_admin_id,
  project_id: privilege_project_id
)
puts "#{privilege.user.username} assigned #{privilege.admin.username} to #{privilege.project.title} as admin"

3.times do
  privilege_user_id = User.first.id
  privilege_admin_id = User.all.sample.id
  privilege_project_id = Project.first.id

  privilege = Privilege.create!(
    user_id: privilege_user_id,
    admin_id: privilege_admin_id,
    project_id: privilege_project_id
  )
  puts "#{privilege.user.username} assigned #{privilege.admin.username} to #{privilege.project.title} as admin"
end

puts 'Creating collaborations for main project...'
sleep(1)

User.all.each do |user|
  collaboration_project_id = Project.first.id
  collaboration_user_id = User.first.id
  collaboration_member_id = user.id
  collaboration_role = %w[developer designer UX].sample

  collaboration = Collaboration.create!(
    user_id: collaboration_user_id,
    member_id: collaboration_member_id,
    project_id: collaboration_project_id,
    role: collaboration_role
  )
  puts "Assigned #{collaboration.member.username} as a #{collaboration.role} to project: '#{collaboration.project.title}'"
end

puts 'Creating project sections...'
sleep(1)

4.times do
  section_user_id = Project.first.privileges.sample.user.id
  section_project_id = Project.first.id
  section_color_id = Color.all.sample.id
  section_leader_id = User.all.sample.id
  section_title = Faker::Book.title
  section_description = Faker::Quote.famous_last_words
  section_start_date = Date.today.prev_day(rand(8..20))
  section_end_date = Date.today.next_day(rand(20..45))

  section = Section.create!(
    user_id: section_user_id,
    project_id: section_project_id,
    color_id: section_color_id,
    leader_id: section_leader_id,
    title: section_title,
    description: section_description,
    start_date: section_start_date,
    end_date: section_end_date
  )
  puts "Section #{section.title} created"
end

puts 'Creating sections teamings...'
sleep(1)

puts 'Creating cards...'
sleep(1)

# 20.times do
#   card_user_id =
#     card_section_id
#   card_leader_id
#   card_color_id
#   card_title
#   card_description
#   card_start_date
#   card_end_date
#   card_priority
#   card_status
#   card_category

#   card = Card.create!(
#     user_id: card_user_id,
#     section_id: card_section_id,
#     leader_id: card_leader_id,
#     color_id: card_color_id,
#     title: card_title,
#     description: card_description,
#     start_date: card_start_date,
#     end_date: card_end_date,
#     priority: card_priority,
#     status: card_status,
#     category: card_category
#   )
#   puts "card '#{card.title}'"
# end

puts 'Creating comments...'
sleep(1)

puts 'Creating responses...'
sleep(1)

puts 'Seed successfully created!!!!'
