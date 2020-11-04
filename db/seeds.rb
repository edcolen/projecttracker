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

20.times do
  tag_name = Faker::Coffee.variety
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
  project_title = Faker::Book.title
  project_description = Faker::TvShows::Seinfeld.quote
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

puts 'Creating main project sections...'
sleep(1)

5.times do
  section_user_id = Project.first.privileges.sample.user.id
  section_project_id = Project.first.id
  section_color_id = Color.all.sample.id
  section_leader_id = Project.first.members.sample.id
  section_title = Faker::Book.title
  section_description = Faker::Quote.famous_last_words
  section_start_date = Project.first.start_date.next_day(rand(8..20))
  section_end_date = section_start_date.next_day(rand(20..45))

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

  SectionTeaming.create!(
    user_id: section_user_id,
    member_id: section_leader_id,
    section_id: section.id
  )
  puts "Section leader #{section.leader.username} assigned as member"
end

puts 'Creating sections teamings for main project...'
sleep(1)

Project.first.members.each do |user|
  2.times do
    section_teaming_section_id = Section.all.sample.id
    section_teaming_user_id = Section.find(section_teaming_section_id).leader.id
    section_teaming_member_id = user.id

    section_teaming = SectionTeaming.create!(
      user_id: section_teaming_user_id,
      member_id: section_teaming_member_id,
      section_id: section_teaming_section_id
    )
    puts "Assigned #{section_teaming.member.username} to section: '#{section_teaming.section.title}'"
  end
end

puts 'Creating sections taggings for main project...'
sleep(1)

Section.all.each do |section|
  Tag.all.sample(5).each do |tag|
    section_tagging_user_id = section.members.sample.id
    section_tagging_section_id = section.id
    section_tagging_tag_id = tag.id

    section_tagging = SectionTagging.create!(
      user_id: section_tagging_user_id,
      section_id: section_tagging_section_id,
      tag_id: section_tagging_tag_id
    )
    puts "Tagged section '#{section_tagging.section.title}' with #{section_tagging.tag.name}"
  end
end

puts 'Creating main project cards...'
sleep(1)

25.times do
  card_section_id = Section.all.sample.id
  card_user_id = Section.find(card_section_id).members.sample.id
  card_leader_id = card_user_id
  card_color_id = Color.all.sample.id
  card_title = Faker::Book.title
  card_description = Faker::ChuckNorris.fact
  card_start_date = Section.find(card_section_id).start_date.next_day(rand(2..20))
  card_end_date = card_start_date.next_day(rand(20..45))
  card_priority = %w[low medium high].sample
  card_status = %w[new new new in\ progress in\ progress done].sample
  card_category = %w[feature feature issue].sample

  card = Card.create!(
    user_id: card_user_id,
    section_id: card_section_id,
    leader_id: card_leader_id,
    color_id: card_color_id,
    title: card_title,
    description: card_description,
    start_date: card_start_date,
    end_date: card_end_date,
    priority: card_priority,
    status: card_status,
    category: card_category
  )
  puts "card '#{card.title}' created by #{card.user.username}"

  CardTeaming.create!(
    user_id: card_user_id,
    member_id: card_user_id,
    card_id: card.id
  )
  puts "Card leader #{card.leader.username} assigned as member"
end

puts 'Creating cards teamings for main project...'
sleep(1)

Project.first.sections.each do |section|
  section.members.each do |member|
    rand(1..3).times do
      card_teaming_card_id = section.cards.sample.id
      card_teaming_user_id = Card.find(card_teaming_card_id).leader.id
      card_teaming_member_id = member.id

      card_teaming = CardTeaming.create!(
        user_id: card_teaming_user_id,
        member_id: card_teaming_member_id,
        card_id: card_teaming_card_id
      )
      puts "Assigned #{card_teaming.member.username} to card: '#{card_teaming.card.title}'"
    end
  end
end

puts 'Creating card taggings for main project...'
sleep(1)

Card.all.each do |card|
  Tag.all.sample(5).each do |tag|
    card_tagging_user_id = card.members.sample.id
    card_tagging_card_id = card.id
    card_tagging_tag_id = tag.id

    card_tagging = CardTagging.create!(
      user_id: card_tagging_user_id,
      card_id: card_tagging_card_id,
      tag_id: card_tagging_tag_id
    )
    puts "Tagged card '#{card_tagging.card.title}' with #{card_tagging.tag.name}"
  end
end

puts 'Creating main project comments...'
sleep(1)

Card.all.each do |card|
  rand(1..4).times do
    comment_user_id = card.members.sample.id
    comment_card_id = card.id
    comment_content = Faker::Quote.famous_last_words

    comment = Comment.create!(
      user_id: comment_user_id,
      card_id: comment_card_id,
      content: comment_content
    )
    puts "#{comment.user.username} commented on #{comment.card.title}"
  end
end
puts "#{Comment.count} comments created"

puts 'Creating comments taggings...'
sleep(1)

Comment.all.each do |comment|
  comment_tags = Tag.all.sample(5)
  rand(1..4).times do
    comment_tag_tag_id = comment_tags.sample.id
    comment_tag_comment_id = comment.id

    CommentTagging.create!(
      tag_id: comment_tag_tag_id,
      comment_id: comment_tag_comment_id
    )
  end
end
puts "#{CommentTagging.count} comments were tagged"

puts 'Creating responses...'
sleep(1)

Comment.all.each do |comment|
  rand(1..4).times do
    response_user_id = comment.card.section.members.sample.id
    response_comment_id = comment.id
    response_content = Faker::ChuckNorris.fact

    Response.create!(
      user_id: response_user_id,
      comment_id: response_comment_id,
      content: response_content
    )
  end
end
puts "#{Response.count} responses were created"
sleep(1)

puts 'Seed successfully done!!!!'
