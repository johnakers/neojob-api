puts 'Starting seeds'

puts '--- Deleting old data'
JobApplication.destroy_all
Session.destroy_all
User.destroy_all

puts '--- Creating new data'

user = User.create!(
  id: '00000000-0000-0000-0000-000000000000',
  email: 'ellen.ripley@email.net',
  password: 'pass',
  display_name: 'Ellen',
  timezone: 'Pacific Time (US & Canada)'
)

Session.create!(
  id: '00000000-0000-0000-0000-000000000000',
  user_id: user.id
)

user.job_applications.create!(
  id: '00000000-0000-0000-0000-000000000000',
  company_name: 'Sony Playstation',
  position_name: 'Software Engineer',
  applied_on: Time.now.utc,
  interest_level: 5
)

puts '==========================='
puts "email:   #{user.email}"
puts "session: #{user.reload.session.id}"
puts '==========================='

puts 'Seeds completed'

# curl -u ellen.ripley@email.net:00000000-0000-0000-0000-000000000000 localhost:3000/users/00000000-0000-0000-0000-000000000000
