puts 'Cleaning Previous Seeds'

Meal.delete_all
Restaurant.delete_all
MealType.delete_all
RestaurantType.delete_all
Profile.delete_all
User.delete_all


puts 'Create Restaurant Types'
RestaurantType.create!(name: "Italien")
RestaurantType.create!(name: "Americain")
RestaurantType.create!(name: "Thai")
RestaurantType.create!(name: "Japonais")
RestaurantType.create!(name: "Français")
RestaurantType.create!(name: "Mexicain")
RestaurantType.create!(name: "Marocain")
RestaurantType.create!(name: "Argentin")
RestaurantType.create!(name: "Chinois")
RestaurantType.create!(name: "Libanais")
RestaurantType.create!(name: "Turque")
RestaurantType.create!(name: "Espagnol")
RestaurantType.create!(name: "Russe")
RestaurantType.create!(name: "Vietnamien")
RestaurantType.create!(name: "Ethiopien")


puts 'Create Meals Types'
MealType.create!(name: "Entrées")
MealType.create!(name: "Plats")
MealType.create!(name: "Desserts")
MealType.create!(name: "Boissons")
MealType.create!(name: "Menus")

puts 'Create Users'
user = User.new(email: 'mulliez.augustin@gmail.com', password: 'pickeatup')
user.save!
user.profile.update!(
    first_name:   'Augustin',
    last_name:    'Mulliez',
    date_of_birth: Date.parse('01/05/1991'),
    phone_number: '06 60 60 60 60',
    remote_picture_url: 'http://unsplash.it/300/300?random'
    )

user = User.new(email: "louis.dublancq@gmail.com", password: 'pickeatup')
user.save!
user.profile.update!(
    first_name:   'Louis',
    last_name:    'Dublancq',
    date_of_birth: Date.parse('30/01/1991'),
    phone_number: '06 20 20 20 20',
    remote_picture_url: 'http://unsplash.it/300/300?random'
    )

user = User.new(email: "bn.lemaire@gmail.com", password: 'pickeatup')
user.save!
user.profile.update!(
    first_name:   'Benjamin',
    last_name:    'Lemaire',
    date_of_birth: Date.parse('26/05/1986'),
    phone_number: '06 80 80 80 80',
    remote_picture_url: 'http://unsplash.it/300/300?random'
    )
#user.profile.update_attributes!()

user = User.new(email: "guillaume@fortaine.com", password: 'pickeatup')
user.save!
user.profile.update!(
    first_name:   'Guillaume',
    last_name:    'Fortaine',
    date_of_birth: Date.parse('01/01/2000'),
    phone_number: '06 40 40 40 40',
    remote_picture_url: 'http://unsplash.it/300/300?random'
    )

puts 'Generating Restaurants'
restaurant_types = RestaurantType.all
meal_types = MealType.all

20.times do
  user = User.all.sample(1).first
  restaurant = user.restaurants.build(
    name:             Faker::Company.name,
    street_number:    (1..999).to_a.sample,
    route:            Faker::Address.street_name,
    locality:         Faker::Address.city,
    administrative_area_level_1: Faker::Address.state,
    postal_code:      Faker::Address.postcode,
    country:          Faker::Address.country,
    restaurant_type:  restaurant_types.sample(1).first,
    user: user,
    remote_logo_url: 'http://unsplash.it/300/300?random'
    )
  restaurant.save!
end

prep = [10, 15, 20, 25, 30]

puts 'Generating Meals'
60.times do
  restaurant = Restaurant.all.sample(1).first
  meal = restaurant.meals.build(
    name:             Faker::Commerce.product_name,
    price:            Faker::Commerce.price,
    prep_time:        prep.sample(1).first,
    description:      Faker::Lorem.sentences,
    meal_type:        meal_types.sample(1).first,
    restaurant:       restaurant,
    remote_picture_url: 'http://unsplash.it/300/300?random'
    )
  meal.save!
end
