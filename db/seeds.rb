puts 'Removing the restaurants...'
Restaurant.destroy_all

chefs = ['Nikki', 'Joshua', 'Yu', 'Bill', 'Daniel', 'Yaya', 'Mounir', 'Soufiane', 'Adam', 'Ayaka', 'Alison', 'Kyle', 'Alex', 'Tony', 'Sae', 'Oanh', 'Andre', 'Mark', 'Leo', 'Jan', 'Koki', 'Malene', 'Carla', 'Song']

puts "Creating #{chefs.count} Restaurants..."
chefs.shuffle.each do |name|
  Restaurant.create!(
    name: "#{name}'s #{Faker::Restaurant.name}",
    address: Faker::Address.street_address,
    rating: rand(1..5),
    category: Faker::Restaurant.type.split.first,
    chef_name: name
  )
end
puts "...created #{Restaurant.count} restaurants"
