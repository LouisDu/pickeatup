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
    )

lucce = User.new(email: "louis.dublancq@gmail.com", password: 'pickeatup')
lucce.save!
lucce.profile.update!(
    first_name:   'Louis',
    last_name:    'Dublancq',
    date_of_birth: Date.parse('30/01/1991'),
    phone_number: '06 20 20 20 20',
    )

ben = User.new(email: "bn.lemaire@gmail.com", password: 'pickeatup')
ben.save!
ben.profile.update!(
    first_name:   'Benjamin',
    last_name:    'Lemaire',
    date_of_birth: Date.parse('26/05/1986'),
    phone_number: '06 80 80 80 80',
    )

guillaume = User.new(email: "guillaume@fortaine.com", password: 'pickeatup')
guillaume.save!
guillaume.profile.update!(
    first_name:   'Guillaume',
    last_name:    'Fortaine',
    date_of_birth: Date.parse('01/01/2000'),
    phone_number: '06 40 40 40 40',
    )

flix = User.new(email: "flix@doomit.com", password: 'pickeatup')
flix.save!
flix.profile.update!(
    first_name:   'Flix',
    last_name:    'Abraham',
    date_of_birth: Date.parse('01/01/1985'),
    phone_number: '06 50 50 50 50',
    )

puts 'Generating Restaurants'

# GUS  Resto

  thaï = gus.restaurants.build(
    name:             "Mon Petit Thaï",
    street_number:    (1..30).to_a.sample,
    route:            "Rue esquermoise",
    locality:         "Lille",
    administrative_area_level_1: "Nord-pas-de-calais",
    postal_code:      "59000",
    country:          "France",
    restaurant_type:  Thai,
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
    restaurant_type:  Italien,
    )
  vite.save!

# LUCCE Resto
#
  mamounia = lucce.restaurants.build(
    name:             "La Mamounia",
    street_number:    (1..30).to_a.sample,
    route:            "Rue Royal",
    locality:         "Lille",
    administrative_area_level_1: "Nord-pas-de-calais",
    postal_code:      "59000",
    country:          "France",
    restaurant_type:  Marocain,
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

# BEN resto

 chezben = lucce.restaurants.build(
    name:             "Chez Benamou",
    street_number:    (1..30).to_a.sample,
    route:            "Rue de la cles",
    locality:         "Lille",
    administrative_area_level_1: "Nord-pas-de-calais",
    postal_code:      "59000",
    country:          "France",
    restaurant_type:  Français,
    )
  chezben.save!

  barouge = lucce.restaurants.build(
    name:             "Le Bar Rouge",
    street_number:    (1..30).to_a.sample,
    route:            "Rue Saint Andres",
    locality:         "Lille",
    administrative_area_level_1: "Nord-pas-de-calais",
    postal_code:      "59000",
    country:          "France",
    restaurant_type:  Russe,
    )
  barouge.save!



puts 'Generating Meals'

price_e = (5..10).to_a
prep_e = (5..15).to_a
price = (10..30).to_a
prep = (10..25).to_a

# meals pour resto THAI

  croquettes = thaï.meals.build(
    name:             "Croquettes de thon",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Un plat rapide, frais, équilibré et original ! Accompagné d'une petite salade, ce sera parfait !",
    meal_type:        Entrées,
    )
  croquettes.save!

  soupethai = thaï.meals.build(
    name:             "Soupe thaïlandaise tom yum",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Excellente soupe thailandaise aux crevettes rouges",
    meal_type:        Entrées,
    )
  soupethai.save!

  saladethai = thaï.meals.build(
    name:             "Salade de poulet",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Une salade fraîcheur avec toutes les composantes de goût chères à la cuisine thaï : salé, sucré, acide, amer, épicé.",
    meal_type:        Entrées,
    )
  saladethai.save!

  padthai = thaï.meals.build(
    name:             "Pad Thai",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "plat traditionnel thaï à base de pâtes très apprécié et très consommé dans toute la Thaïlande.",
    meal_type:        Plats,
    )
  padthai.save!

  curryjaune = thaï.meals.build(
    name:             "Curry jaune de crevettes",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Le curry jaune thaïlandais est doux et très parfumé...",
    meal_type:        Plats,
    )
  curryjaune.save!

  boeufangus = thaï.meals.build(
    name:             "Bœuf Angus piquant au basilic thaï",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Un plat typique, tellement épicé et délicieux !",
    meal_type:        Plats,
    )
  boeufangus.save!

  crepe = thaï.meals.build(
    name:             "Crêpes au lait de coco",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Déguster les crêpes chaudes.",
    meal_type:        Desserts,
    )
  crepe.save!

  creme = thaï.meals.build(
    name:             "Crème thaïlandaise au lait de coco",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "La creme brulée made in Thailande!!",
    meal_type:        Desserts,
    )
  creme.save!

  coca = thaï.meals.build(
    name:             "Coca",
    price:            2,
    prep_time:        1,
    description:      "Boisson gazeuse",
    meal_type:        Boissons,
    )
  coca.save!

  perrier = thaï.meals.build(
    name:             "Perrier",
    price:            2,
    prep_time:        1,
    description:      "Eau petillante",
    meal_type:        Boissons,
    )
  perrier.save!

  evian = thaï.meals.build(
    name:             "Evian",
    price:            2,
    prep_time:        1,
    description:      "Eau platte",
    meal_type:        Boissons,
    )
  evian.save!

# meals pour resto ITALIEN
#
  insalata = vite.meals.build(
    name:             "Insalata Caprese",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Tomates, mozzarella di bufala",
    meal_type:        Entrées,
    )
  insalata.save!

  carpaccio = vite.meals.build(
    name:             "Carpaccio de courgettes & noix de St Jacques",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Un carpaccio de  ouff!!!",
    meal_type:        Entrées,
    )
  carpaccio.save!

  insalatadi = vite.meals.build(
    name:             "Insalata di Bresaola",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Roquette, bresaola, haricots verts, gingembre & amandes",
    meal_type:        Entrées,
    )
  insalatadi.save!

  puttanesca = vite.meals.build(
    name:             "Spaghetti alla puttanesca",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Câpres, olives, tomates!! Deliceux.",
    meal_type:        Plats,
    )
  puttanesca.save!

  scialatielli = vite.meals.build(
    name:             "Scialatielli all Norma",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Les Scialatielli au persil sont différents des Scialatielli traditionnels par le vert pâle du persil",
    meal_type:        Plats,
    )
  scialatielli.save!

  lasagne = vite.meals.build(
    name:             "Lasagne alla bolognese",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Un plat typique!",
    meal_type:        Plats,
    )
  lasagne.save!

  tiramisu = vite.meals.build(
    name:             "Tiramisu della zia",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Que pale tiramisu!",
    meal_type:        Desserts,
    )
  tiramisu.save!

  panna = vite.meals.build(
    name:             "Panna cotta au coulis de fraise",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Panna, hum c'est bon",
    meal_type:        Desserts,
    )
  panna.save!

  coca = vite.meals.build(
    name:             "Coca",
    price:            2,
    prep_time:        1,
    description:      "Boisson gazeuse",
    meal_type:        Boissons,
    )
  coca.save!

  perrier = vite.meals.build(
    name:             "Perrier",
    price:            2,
    prep_time:        1,
    description:      "Eau petillante",
    meal_type:        Boissons,
    )
  perrier.save!

  evian = vite.meals.build(
    name:             "Evian",
    price:            2,
    prep_time:        1,
    description:      "Eau platte",
    meal_type:        Boissons,
    )
  evian.save!

#meals resto MAROCAIN ESSAOUIRA

  choux = essaouira.meals.build(
    name:             "Choux farcis libanais ",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Les premiers choux malouf",
    meal_type:        Entrées,
  )
  choux.save!

  houmous = essaouira.meals.build(
    name:             "Houmous fait maison",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Le meilleur houmous de Lille",
    meal_type:        Entrées,
    )
  houmous.save!

  baba = essaouira.meals.build(
    name:             "Baba ghannouj",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Avec de la pita, c'est un regal!",
    meal_type:        Entrées,
    )
  baba.save!

  tajine = essaouira.meals.build(
    name:             "La Tajine du Chef",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Tajine d'agneau avec les meilleurs épices marocaines.",
    meal_type:        Plats,
    )
  tajine.save!

  couscous = essaouira.meals.build(
    name:             "Le couscous berbère",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Mélange de viande, de légumes et de semoule de blé cuite à la vapeur",
    meal_type:        Plats,
    )
  couscous.save!

  pastilla = essaouira.meals.build(
    name:             "Pastilla",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Feuilleté, fabriqué à partir de feuilles brick, farci de viande ou de poulet",
    meal_type:        Plats,
    )
  pastilla.save!

  fruits = essaouira.meals.build(
    name:             "Fruits secs caramélisés et eau de fleur d'oranger",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Briouate de fruits secs",
    meal_type:        Desserts,
    )
  fruits.save!

  pastilla = essaouira.meals.build(
    name:             "Pastilla Marrakchia, lait, amandes et fleurs d'oranger",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Une véritable pastilla typique de Marrakech à base de crème frangipane parfumée à la fleur d'oranger.",
    meal_type:        Desserts,
    )
  pastilla.save!

  coca = essaouira.meals.build(
    name:             "Coca",
    price:            2,
    prep_time:        1,
    description:      "Boisson gazeuse",
    meal_type:        Boissons,
    )
  coca.save!

  perrier = essaouira.meals.build(
    name:             "Perrier",
    price:            2,
    prep_time:        1,
    description:      "Eau petillante",
    meal_type:        Boissons,
    )
  perrier.save!

  evian = essaouira.meals.build(
    name:             "Evian",
    price:            2,
    prep_time:        1,
    description:      "Eau platte",
    meal_type:        Boissons,
    )
  evian.save!

# meals resto MAROCAIN MANOUNIA

  saladesm = mamounia.meals.build(
    name:             "Salade de pommes de terre aux haricots verts",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Delicieuse salade importe directement du Maroc",
    meal_type:        Entrées,
  )
  saladesm.save!

  taboulé = mamounia.meals.build(
    name:             "Le vrai taboulé libanais",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Le seul taboulé libanais fait par des marocains",
    meal_type:        Entrées,
    )
  taboulé.save!

  wraps = mamounia.meals.build(
    name:             "Wraps de falafels à la salade piquante",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Des wraps, des wraps, des wraps!",
    meal_type:        Entrées,
    )
  wraps.save!

  rfissa = mamounia.meals.build(
    name:             "La Rfissa",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Fines feuilles de msemen généreusement arrosées d’une sauce au poulet et de lentilles, le tout bien parfumé.",
    meal_type:        Plats,
    )
  rfissa.save!

  tanjia = mamounia.meals.build(
    name:             "La Tanjia",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Déguster la avec du pain cuit à l’ancienne et elle sera un vrai délice !",
    meal_type:        Plats,
    )
  tanjia.save!

  seffa = mamounia.meals.build(
    name:             "la Seffa",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Elle est composé de vermicelles qu’on appelle cheveux d’ange ainsi que de raisins secs et de cannelle. Accompagnée de poulet et décorée avec du sucre glacé et amandes concassée, elle devient un plat inoubliable!",
    meal_type:        Plats,
    )
  seffa.save!

  corne = mamounia.meals.build(
    name:             "Corne de gazelle",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Petits gâteaux marocains en forme de corne, garnis d'une pâte d'amande à la fleur d'oranger.",
    meal_type:        Desserts,
    )
  corne.save!

  baklavas = mamounia.meals.build(
    name:             "Baklavas aux amandes et pistaches",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Petits gâteaux marocains constitués de pâte feuilletée au coeur de pâte d'amande et pistache, recouverts",
    meal_type:        Desserts,
    )
  baklavas.save!

  coca = mamounia.meals.build(
    name:             "Coca",
    price:            2,
    prep_time:        1,
    description:      "Boisson gazeuse",
    meal_type:        Boissons,
    )
  coca.save!

  perrier = mamounia.meals.build(
    name:             "Perrier",
    price:            2,
    prep_time:        1,
    description:      "Eau petillante",
    meal_type:        Boissons,
    )
  perrier.save!

  evian = mamounia.meals.build(
    name:             "Evian",
    price:            2,
    prep_time:        1,
    description:      "Eau platte",
    meal_type:        Boissons,
    )
  evian.save!

# meals resto FRANCAIS CHEZ BENAMOU

  escargots = mamounia.meals.build(
    name:             "12 escargots de Bourgogne",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Escargots à l'ail et aux échalotes",
    meal_type:        Entrées,
  )
  escargots.save!

  huitres = mamounia.meals.build(
    name:             "Huitres  N°3",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Huitres directement importées de Corée du Nord ",
    meal_type:        Entrées,
    )
  huitres.save!

  grenouille = mamounia.meals.build(
    name:             "Quatre cuisses de grenouille",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Grenouilles à la crème de persil de Robuchon",
    meal_type:        Entrées,
    )
  grenouille.save!

  sole = mamounia.meals.build(
    name:             "La sole",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Sole Meunière au piment d'Espelette.",
    meal_type:        Plats,
    )
  sole.save!

  agneau = mamounia.meals.build(
    name:             "Le quintuple d'Agneau",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "Côtelettes d'agneau avec cresson",
    meal_type:        Plats,
    )
  agneau.save!

  bavette = mamounia.meals.build(
    name:             "la bavette d'Aloyau",
    price:            price.sample(1).first,
    prep_time:        prep.sample(1).first,
    description:      "la bavette d'Aloyau aux échalotes",
    meal_type:        Plats,
    )
  bavette.save!

  cbrule = mamounia.meals.build(
    name:             "Crème brûlée",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Crème brûlée vanille",
    meal_type:        Desserts,
    )
  cbrule.save!

  baklavas = mamounia.meals.build(
    name:             "Oeufs à la neige",
    price:            price_e.sample(1).first,
    prep_time:        prep_e.sample(1).first,
    description:      "Oeufs à la neige avec sa crème anglaise.",
    meal_type:        Desserts,
    )
  baklavas.save!

  champ = mamounia.meals.build(
    name:             "Tsarine champagne",
    price:            10,
    prep_time:        1,
    description:      "Champagne",
    meal_type:        Boissons,
    )
  champ.save!

  perrier = mamounia.meals.build(
    name:             "Perrier",
    price:            2,
    prep_time:        1,
    description:      "Eau petillante",
    meal_type:        Boissons,
    )
  perrier.save!

  evian = mamounia.meals.build(
    name:             "Evian",
    price:            2,
    prep_time:        1,
    description:      "Eau platte",
    meal_type:        Boissons,
    )
  evian.save!

puts 'Generating REVIEWS'

# review pour resto THAI

  review = boeufangus.reviews.build(
    rating:           4,
    content:          "Pas mal!",
    user:             guillaume,
    )
  review.save!

  review = boeufangus.reviews.build(
    rating:           2,
    content:          "Pas ouf!",
    user:             ben,
    )
  review.save!

  review = curryjaune.reviews.build(
    rating:           5,
    content:          "Une superbe expérience de cuisine Thai!",
    user:             lucce,
    )
  review.save!

  review = curryjaune.reviews.build(
    rating:           5,
    content:          "D-E-L-I-C-I-E-U-X!",
    user:             ben,
    )
  review.save!

  review = padthai.reviews.build(
    rating:           5,
    content:          "Le meilleur padthai au monde!",
    user:             ben,
    )
  review.save!

  review = padthai.reviews.build(
    rating:           3,
    content:          "Pas mauvais, mais froid",
    user:             guillaume,
    )
  review.save!

  review = padthai.reviews.build(
    rating:           5,
    content:          "Super!!!!",
    user:             lucce,
    )
  review.save!

# review pour resto ITALIEN
#
  review = lasagne.reviews.build(
    rating:           4,
    content:          "Pas mal!",
    user:             guillaume,
    )
  review.save!

  review = lasagne.reviews.build(
    rating:           5,
    content:          "Top!",
    user:             ben,
    )
  review.save!

  review = puttanesca.reviews.build(
    rating:           5,
    content:          "Une superbe expérience!",
    user:             lucce,
    )
  review.save!

  review = puttanesca.reviews.build(
    rating:           5,
    content:          "D-E-L-I-C-I-E-U-X!",
    user:             ben,
    )
  review.save!

  review = scialatielli.reviews.build(
    rating:           5,
    content:          "Le meilleur scialatielli au monde!",
    user:             ben,
    )
  review.save!

  review = scialatielli.reviews.build(
    rating:           3,
    content:          "Pas mauvais, mais froid",
    user:             guillaume,
    )
  review.save!

  review = scialatielli.reviews.build(
    rating:           5,
    content:          "Super!!!!",
    user:             lucce,
    )
  review.save!

  # review pour resto ESSAOUIRA
#
  review = tajine.reviews.build(
    rating:           4,
    content:          "Pas mal!",
    user:             guillaume,
    )
  review.save!

  review = tajine.reviews.build(
    rating:           5,
    content:          "Superbe!",
    user:             ben,
    )
  review.save!

  review = couscous.reviews.build(
    rating:           5,
    content:          "Une superbe expérience!",
    user:             lucce,
    )
  review.save!

  review = couscous.reviews.build(
    rating:           5,
    content:          "D-E-L-I-C-I-E-U-X!",
    user:             ben,
    )
  review.save!

  review = pastilla.reviews.build(
    rating:           5,
    content:          "La meilleure pastilla au monde!",
    user:             ben,
    )
  review.save!

  review = pastilla.reviews.build(
    rating:           3,
    content:          "Pas mauvais, mais froid",
    user:             guillaume,
    )
  review.save!

  review = pastilla.reviews.build(
    rating:           5,
    content:          "Super!!!!",
    user:             gus,
    )
  review.save!

  # review pour resto MAMOUNIA
#
  review = rfissa.reviews.build(
    rating:           4,
    content:          "Pas mal!",
    user:             guillaume,
    )
  review.save!

  review = rfissa.reviews.build(
    rating:           5,
    content:          "Superbe!",
    user:             ben,
    )
  review.save!

  review = tanjia.reviews.build(
    rating:           5,
    content:          "Une superbe expérience!",
    user:             lucce,
    )
  review.save!

  review = tanjia.reviews.build(
    rating:           5,
    content:          "D-E-L-I-C-I-E-U-X!",
    user:             ben,
    )
  review.save!

  review = seffa.reviews.build(
    rating:           5,
    content:          "Le meilleur seffa au monde!",
    user:             ben,
    )
  review.save!

  review = seffa.reviews.build(
    rating:           3,
    content:          "Pas mauvais, mais froid",
    user:             guillaume,
    )
  review.save!

  review = seffa.reviews.build(
    rating:           5,
    content:          "Super!!!!",
    user:             gus,
    )
  review.save!

# review pour resto MAMOUNIA

review = bavette.reviews.build(
    rating:           4,
    content:          "Pas mal!",
    user:             guillaume,
    )
  review.save!

  review = bavette.reviews.build(
    rating:           2,
    content:          "Dinguo!",
    user:             lucce,
    )
  review.save!

  review = agneau.reviews.build(
    rating:           5,
    content:          "Une superbe expérience de cuisine Francaise grace au patron , Benamou!",
    user:             lucce,
    )
  review.save!

  review = agneau.reviews.build(
    rating:           5,
    content:          "D-E-L-I-C-I-E-U-X!",
    user:             gus,
    )
  review.save!

  review = sole.reviews.build(
    rating:           5,
    content:          "Le meilleur padthai au monde!",
    user:             gus,
    )
  review.save!

  review = sole.reviews.build(
    rating:           4,
    content:          "Excellent",
    user:             guillaume,
    )
  review.save!

  review = sole.reviews.build(
    rating:           5,
    content:          "Super!!!! meilleur resto au monde!",
    user:             lucce,
    )
  review.save!
