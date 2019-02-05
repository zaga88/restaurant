p "Create test table"

Table.find_or_create_by(name: 'table_one') do |table|
  table.min_guest = 1
  table.max_guest = 6
  table.restaurant_id = Restaurant.all.sample.id
end
