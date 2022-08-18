require 'yaml'

puts 'Removing the restaurants and users...'
Restaurant.destroy_all
User.destroy_all

puts 'Creating users'
User.create!(email: 'trouni@me.com', name: 'Trouni', password: '123123', avatar_url: 'https://kitt.lewagon.com/placeholder/users/trouni')
User.create!(email: 'doug@me.com', name: 'Doug', password: '123123', avatar_url: 'https://kitt.lewagon.com/placeholder/users/dmbf29')

chefs = ['Nikki', 'Joshua', 'Yu', 'Bill', 'Daniel', 'Yaya', 'Mounir', 'Soufiane', 'Adam', 'Ayaka', 'Alison', 'Kyle', 'Alex', 'Tony', 'Sae', 'Oanh', 'Andre', 'Mark', 'Leo', 'Jan', 'Koki', 'Malene', 'Carla', 'Song']

# Load addresses YML file
addresses_file = File.open('db/addresses.yml').read
addresses = YAML.load(addresses_file)

puts "Creating #{chefs.count} Restaurants..."
chefs.shuffle.each do |name|
  Restaurant.create!(
    name: "#{name}'s #{Faker::Restaurant.name}",
    address: addresses.sample,
    description: Faker::Restaurant.description,
    rating: rand(1..5),
    category: Faker::Restaurant.type.split.first,
    chef_name: name,
    user: User.all.sample
  )
end
puts "...created #{Restaurant.count} restaurants"
