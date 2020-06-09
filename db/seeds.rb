# Edit the variables below to control the number of items to generate in each table of the database
nb_users = 1
nb_customers = 1
nb_quotes = 1

# Arrays used to store all created objects during the seeding
users = []
customers = []

# Reset tables in the database
User.destroy_all
Customer.destroy_all
Quote.destroy_all

# Populate users
nb_users.times do |i|
  users << User.create!(
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

  puts "#{i+1} user(s) generated"

  # Populate customers
  nb_customers.times do |i|
    customers << Customer.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        company_name: Faker::Company.name,
        company_id: "36252187900034",
        address: Faker::Address.street_address,
        zip_code: Faker::Address.zip_code,
        country: "FRANCE",
        phone_number: "0612131415",
        email: Faker::Name.first_name + "@yopmail.com",
        is_professional: true,
        user: users.sample
    )

    puts "#{i+1} customer(s) generated"
  end
end

# Populate quotes
nb_quotes.times do |i|

  customer = customers.sample

  Quote.create!(
      version_number: "#{customer.first_name[0]}#{customer.last_name[0]}#{DateTime.now.strftime("%d%m%Y%H%M%S")}#{i}",
      amount: rand(250..5000),
      discount: 0,
      sent: DateTime.now,
      sending_counter: 0,
      is_invoice: false,
      user: users.sample,
      customer: customer
  )

  puts "#{i+1} quote(s) generated"
end
