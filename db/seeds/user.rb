p "Create test user"

User.find_or_create_by(email: 'user@test.com') do |user|
  user.password = '11111111'
  user.password_confirmation = '11111111'
  user.name = 'Ivan'
end
