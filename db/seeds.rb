if Rails.env.development?
  User.destroy_all
end

user = User.new(email: mulliez.augustin@gmail.com, password: 'pickeatup')
user.save
user = User.new(email: louis.dublancq@gmail.com, password: 'pickeatup')
user.save
user = User.new(email: bn.lemaire@gmail.com, password: 'pickeatup')
user.save
user = User.new(email: guillaume@fortaine.com, password: 'pickeatup')
user.save
