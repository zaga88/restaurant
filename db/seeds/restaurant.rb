p "Create test restaurant"

Restaurant.find_or_create_by(email: 'restaurant@test.com') do |restaurant|
  restaurant.phone_number = '1-333-333-222'
  restaurant.name = 'Prage'
end
