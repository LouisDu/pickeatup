User.destroy_all
RestaurantType.destroy_all
MealType.destroy_all

user = User.new(email: "mulliez.augustin@gmail.com", password: 'pickeatup')
user.save
user = User.new(email: "louis.dublancq@gmail.com", password: 'pickeatup')
user.save
user = User.new(email: "bn.lemaire@gmail.com", password: 'pickeatup')
user.save
user = User.new(email: "guillaume@fortaine.com", password: 'pickeatup')
user.save

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

MealType.create!(name: "Entrées")
MealType.create!(name: "Plats")
MealType.create!(name: "Desserts")
MealType.create!(name: "Boissons")
MealType.create!(name: "Menus")
