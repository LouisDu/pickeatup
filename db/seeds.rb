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
    # remote_picture_url: 'https://s3-eu-west-1.amazonaws.com/pickeatup/uploads/gus.jpg'
    )

user = User.new(email: "louis.dublancq@gmail.com", password: 'pickeatup')
user.save!
user.profile.update!(
    first_name:   'Louis',
    last_name:    'Dublancq',
    date_of_birth: Date.parse('30/01/1991'),
    phone_number: '06 20 20 20 20',
    # remote_picture_url: 'https://s3-eu-west-1.amazonaws.com/pickeatup/uploads/lou.jpg'
    )

user = User.new(email: "bn.lemaire@gmail.com", password: 'pickeatup')
user.save!
user.profile.update!(
    first_name:   'Benjamin',
    last_name:    'Lemaire',
    date_of_birth: Date.parse('26/05/1986'),
    phone_number: '06 80 80 80 80',
    # remote_picture_url: 'https://s3-eu-west-1.amazonaws.com/pickeatup/uploads/ben.jpg'
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

10.times do
  user = User.all.sample(1).first
  restaurant = user.restaurants.build(
    name:             Faker::Team.creature,
    street_number:    (1..100).to_a.sample,
    route:            "Rue esquermoise",
    locality:         "Lille",
    administrative_area_level_1: "Nord-pas-de-calais",
    postal_code:      "59000",
    country:          "France",
    restaurant_type:  restaurant_types.sample(1).first,
    user: user,
    remote_logo_url: 'http://unsplash.it/300/300?random'
    )
  restaurant.save!
end

prep = [10, 15, 20, 25, 30]
price = (5..30).to_a

puts 'Generating Meals'
30.times do
  restaurant = Restaurant.all.sample(1).first
  meal = restaurant.meals.build(
    name:             Faker::Color.color_name,
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      Faker::Lorem.words(4, true),
    meal_type:        meal_types.sample(1).first,
    restaurant:       restaurant,
    remote_picture_url: 'http://unsplash.it/300/300?random'
    )
  meal.save!
end
