puts 'Cleaning Previous Seeds'

Meal.delete_all
Restaurant.delete_all
MealType.delete_all
RestaurantType.delete_all
Profile.delete_all
User.delete_all


puts 'Create Restaurant Types'

Italien = RestaurantType.create!(name: "Italien")
Americain = RestaurantType.create!(name: "Americain")
Thai = RestaurantType.create!(name: "Thai")
Japonais = RestaurantType.create!(name: "Japonais")
Français = RestaurantType.create!(name: "Français")
Mexicain = RestaurantType.create!(name: "Mexicain")
Marocain = RestaurantType.create!(name: "Marocain")
Argentin = RestaurantType.create!(name: "Argentin")
Chinois = RestaurantType.create!(name: "Chinois")
Libanais = RestaurantType.create!(name: "Libanais")
Turque = RestaurantType.create!(name: "Turque")
Espagnol =  RestaurantType.create!(name: "Espagnol")
Russe = RestaurantType.create!(name: "Russe")
Vietnamien = RestaurantType.create!(name: "Vietnamien")
Ethiopien = RestaurantType.create!(name: "Ethiopien")


puts 'Create Meals Types'

Entrées = MealType.create!(name: "Entrées")
Plats = MealType.create!(name: "Plats")
Desserts = MealType.create!(name: "Desserts")
Boissons = MealType.create!(name: "Boissons")
Menus = MealType.create!(name: "Menus")

puts 'Create Users'

gus = User.new(email: 'mulliez.augustin@gmail.com', password: 'pickeatup')
gus.save!
   gus.profile.update!(
   first_name:   'Augustin',
   last_name:    'Mulliez',
   date_of_birth: Date.parse('01/05/1991'),
   phone_number: '06 60 60 60 60',
   # remote_picture_url: 'https://s3-eu-west-1.amazonaws.com/pickeatup/uploads/gus.jpg'
   )

lucce = User.new(email: "louis.dublancq@gmail.com", password: 'pickeatup')
lucce.save!
lucce.profile.update!(
   first_name:   'Louis',
   last_name:    'Dublancq',
   date_of_birth: Date.parse('30/01/1991'),
   phone_number: '06 20 20 20 20',
   # remote_picture_url: 'https://s3-eu-west-1.amazonaws.com/pickeatup/uploads/lou.jpg'
   )

ben = User.new(email: "bn.lemaire@gmail.com", password: 'pickeatup')
ben.save!
ben.profile.update!(
   first_name:   'Benjamin',
   last_name:    'Lemaire',
   date_of_birth: Date.parse('26/05/1986'),
   phone_number: '06 80 80 80 80',
   # remote_picture_url: 'https://s3-eu-west-1.amazonaws.com/pickeatup/uploads/ben.jpg'
   )

guillaume = User.new(email: "guillaume@fortaine.com", password: 'pickeatup')
guillaume.save!
guillaume.profile.update!(
   first_name:   'Guillaume',
   last_name:    'Fortaine',
   date_of_birth: Date.parse('01/01/2000'),
   phone_number: '06 40 40 40 40',
   #remote_picture_url: 'http://unsplash.it/300/300?random'
   )

flix = User.new(email: "flix@doomit.com", password: 'pickeatup')
flix.save!
flix.profile.update!(
   first_name:   'Flix',
   last_name:    'Abraham',
   date_of_birth: Date.parse('01/01/1985'),
   phone_number: '06 50 50 50 50',
   # remote_picture_url: 'http://unsplash.it/300/300?random'
   )


puts 'Generating Restaurants'

 thaï = gus.restaurants.build(
   name:             "Mon Petit Thaï",
   street_number:    (1..30).to_a.sample,
   route:            "Rue esquermoise",
   locality:         "Lille",
   administrative_area_level_1: "Nord-pas-de-calais",
   postal_code:      "59000",
   country:          "France",
   restaurant_type:  Thai
   )
 thaï.save!

 vite = gus.restaurants.build(
   name:             "La Vite",
   street_number:    (1..30).to_a.sample,
   route:            "Rue de la barre",
   locality:         "Lille",
   administrative_area_level_1: "Nord-pas-de-calais",
   postal_code:      "59000",
   country:          "France",
   restaurant_type:  Italien
   )
 vite.save!

 mamounia = lucce.restaurants.build(
   name:             "La Mamounia",
   street_number:    (1..30).to_a.sample,
   route:            "Rue Royal",
   locality:         "Lille",
   administrative_area_level_1: "Nord-pas-de-calais",
   postal_code:      "59000",
   country:          "France",
   restaurant_type:  Marocain
   )
 mamounia.save!

 essaouira = lucce.restaurants.build(
   name:             "Essaouira",
   street_number:    (1..30).to_a.sample,
   route:            "Rue d'Angleterre",
   locality:         "Lille",
   administrative_area_level_1: "Nord-pas-de-calais",
   postal_code:      "59000",
   country:          "France",
   restaurant_type:  Marocain,
   )
 essaouira.save!

 puts 'Generating Meals'

price_e = (500..1000).to_a
prep_e = (5..15).to_a
price = (1000..3000).to_a
prep = (10..25).to_a

  croquettes = thaï.meals.build(
    name:             "Croquettes de thon",
    price:      price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Un plat rapide, frais, équilibré et original ! Accompagné d'une petite salade, ce sera parfait !",
    meal_type:        Entrées
    )
  croquettes.save!

  soupethai = thaï.meals.build(
    name:             "Soupe thaïlandaise tom yum",
    price:      price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Excellente soupe thailandaise aux crevettes rouges",
    meal_type:        Entrées
    )
  soupethai.save!

  saladethai = thaï.meals.build(
    name:             "Salade de poulet",
    price:      price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Une salade fraîcheur avec toutes les composantes de goût chères à la cuisine thaï : salé, sucré, acide, amer, épicé.",
    meal_type:        Entrées
    )
  saladethai.save!

  padthai = thaï.meals.build(
    name:             "Pad Thai",
    price:      price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "plat traditionnel thaï à base de pâtes très apprécié et très consommé dans toute la Thaïlande.",
    meal_type:        Plats
    )
  padthai.save!

  curryjaune = thaï.meals.build(
    name:             "Curry jaune de crevettes",
    price:      price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Le curry jaune thaïlandais est doux et très parfumé...",
    meal_type:        Plats
    )
  curryjaune.save!

  boeufangus = thaï.meals.build(
    name:             "Bœuf Angus piquant au basilic thaï",
    price:      price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Un plat typique, tellement épicé et délicieux !",
    meal_type:        Plats
    )
  boeufangus.save!

  crepe = thaï.meals.build(
    name:             "Crêpes au lait de coco",
    price:      price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Déguster les crêpes chaudes.",
    meal_type:        Desserts
    )
  crepe.save!

  creme = thaï.meals.build(
    name:             "Crème thaïlandaise au lait de coco",
    price:      price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "La creme brulée made in Thailande!!",
    meal_type:        Desserts
    )
  creme.save!

  coca = thaï.meals.build(
    name:             "Coca",
    price:      200,
    prep_time:        1,
    description:      "Boisson gazeuse",
    meal_type:        Boissons
    )
  coca.save!

  perrier = thaï.meals.build(
    name:             "Perrier",
    price:      200,
    prep_time:        1,
    description:      "Eau petillante",
    meal_type:        Boissons
    )
  perrier.save!

  evian = thaï.meals.build(
    name:             "Evian",
    price:      200,
    prep_time:        1,
    description:      "Eau platte",
    meal_type:        Boissons
    )
  evian.save!


  puts 'Generating Reviews'

  review = boeufangus.reviews.build(
    rating:           4,
    content:          "Pas mal!",
    user_id:          guillaume,
    )
  review.save!

  review = curryjaune.reviews.build(
    rating:           5,
    content:          "Une superbe expérience de cuisine Thai!",
    user_id:          lucce,
    )
  review.save!

  review = curryjaune.reviews.build(
    rating:           5,
    content:          "D-E-L-I-C-I-E-U-X!",
    user_id:          ben,
    )
  review.save!

  review = padthai.reviews.build(
    rating:           5,
    content:          "Le meilleur padthai que j'ai mange depuis mon voyage a bangkok en 79",
    user_id:          ben,
    )
  review.save!

  review = padthai.reviews.build(
    rating:           3,
    content:          "Pas mauvais, mais froid",
    user_id:          guillaume,
    )
  review.save!

  review = padthai.reviews.build(
    rating:           5,
    content:          "Super!!!!",
    user_id:          lucce,
    )
  review.save!
