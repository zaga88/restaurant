p "Create test shift"

Shift.find_or_create_by(name: 'morning') do |shift|
  shift.start_time = '10:00'
  shift.end_time = '15:00'
  shift.restaurant_id = Restaurant.all.sample.id
end
