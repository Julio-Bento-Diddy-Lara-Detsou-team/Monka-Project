# Edit the variables below to control the number of items to generate in each table of the database
nb_users = 1

# Reset tables in the database
User.destroy_all

# Populate users
nb_users.times do |i|
  User.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      company_name: Faker::Company.name,
      address: Faker::Address.street_address,
      zip_code: Faker::Address.zip_code,
      country: "FRANCE",
      phone_number: "0664765890",
      company_id: "36252187900034",
      email: Faker::Name.first_name + "@yopmail.com",
      password: "azerty",
      password_confirmation: "azerty",
      is_admin: false
  )

  puts "#{i+1} utilisateur généré(s)"
end
