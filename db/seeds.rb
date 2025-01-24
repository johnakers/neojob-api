puts 'Starting seeds'

puts '--- Deleting old data'
JobApplication.destroy_all
Session.destroy_all
User.destroy_all

puts '--- Creating new data'

user = User.create!(
  email: 'ellen.ripley@email.net',
  password: 'pass',
  timezone: 'Pacific Time (US & Canada)'
)

user.login!

user.job_applications.create!(
  company_name: 'Weyland Yutani',
  position_name: 'Warrant Officer',
  applied_on: Time.now.utc,
  interest_level: 5
)

puts '==========================='
puts "email:   #{user.email}"
puts "session: #{user.reload.session.id}"
puts '==========================='

puts 'Seeds completed'
