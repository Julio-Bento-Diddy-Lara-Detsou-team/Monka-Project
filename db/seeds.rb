# Edit the variables below to control the number of items to generate in each table of the database
nb_users = 5
nb_customers = 5
nb_quotes = 30
nb_goods = 30
nb_join_table = 60

# Arrays used to store all created objects during the seeding
users = []
customers = []
quotes = []
goods = []

# Reset tables in the database
User.destroy_all
Customer.destroy_all
Quote.destroy_all
Good.destroy_all
JoinGoodsQuotesTable.destroy_all

random_boolean = [true, false].sample

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
      company_id: rand(36252187900034 .. 36252987900034 ),
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
        company_id: rand(26252187900034 .. 26252987900034),
        address: Faker::Address.street_address,
        zip_code: Faker::Address.zip_code,
        country: "FRANCE",
        phone_number: "0612131415",
        email: Faker::Name.first_name + "@yopmail.com",
        is_professional: random_boolean,
        user: users.sample
    )

    puts "#{i+1} customer(s) generated"
  end
end

# Populate quotes
nb_quotes.times do |i|

  customer = customers.sample

  quotes << Quote.create!(
      quote_number: "#{customer.first_name[0]}#{customer.last_name[0]}#{DateTime.now.strftime("%d%m%Y%H%M%S")}#{i}",
      invoice_number: nil,
      amount: rand(250..5000),
      discount: 0,
      quote_sending_date: DateTime.now,
      invoice_sending_date: nil,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: false,
      is_paid: false,
      user: users.sample,
      customer: customer)

  puts "#{i+1} quote(s) generated"

  # Populate invoice
  quotes << Quote.create!(
      quote_number: nil,
      invoice_number: "#{customer.first_name[0]}#{customer.last_name[0]}#{DateTime.now.strftime("%d%m%Y%H%M%S")}#{i}",
      amount: rand(250..5000),
      discount: 0,
      quote_sending_date: nil,
      invoice_sending_date: DateTime.now,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: true,
      is_paid: true,
      user: users.sample,
      customer: customer
  )

  puts "#{i+1} invoice(s) generated"
end

# Populate goods
nb_goods.times do |i|
  goods << Good.create!(
      title: Faker::Beer.brand,
      description: Faker::Lorem.sentence,
      quantity: rand(1..5),
      price: rand(1..10),
      user: users.sample)

  puts "#{i+1} good(s) generated"
end

nb_join_table.times do |i|
  JoinGoodsQuotesTable.create!(
      good: goods.sample,
      quote: quotes.sample)

  puts "#{i+1} joints between good(s) and quote(s) generated"
end

#################################################################################
######################### PREVIEW USER FOR TESTING ##############################
#################################################################################

users << User.create!(
    first_name: "Monka",
    last_name: "Mocca",
    company_name: "Monka & Co",
    address: "08 rue Poitou",
    zip_code: "75000",
    country: "FRANCE",
    phone_number: "0607080910",
    company_id: "732 829 320",
    email: "monka@yopmail.com",
    password: "azerty",
    password_confirmation: "azerty",
    is_admin: false
)

puts "Preview user generated"

user = User.find_by(first_name: "Monka")

15.times do |i|
  customers << Customer.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      company_name: Faker::Company.name,
      company_id: rand(26252187900034 .. 26252987900034),
      address: Faker::Address.street_address,
      zip_code: Faker::Address.zip_code,
      country: "FRANCE",
      phone_number: "0612131415",
      email: Faker::Name.first_name + "@yopmail.com",
      is_professional: random_boolean,
      user: user
  )

  puts "Preview #{i+1} customers generated"
end

10.times do |i|
  goods << Good.create!(
      title: Faker::Beer.brand,
      description: Faker::Lorem.sentence,
      quantity: rand(1..5),
      price: rand(1..10),
      user: user
  )

  puts "Preview #{i+1} goods generated"
end

15.times do |i|

  random_date = rand(6.months).seconds.ago
  customer_of_user = user.customers.sample

  quotes << Quote.create!(
      quote_number: "#{customer_of_user.first_name[0]}#{customer_of_user.last_name[0]}#{random_date.strftime("%d%m%Y%H%M%S")}#{i}",
      invoice_number: nil,
      amount: rand(250..5000),
      discount: 0,
      quote_sending_date: random_date,
      invoice_sending_date: nil,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: false,
      is_paid: false,
      user: user,
      customer: customer_of_user)

  puts "Preview #{i+1} quotes generated"
end

6.times do |i|

  random_date = rand(6.months).seconds.ago
  customer_of_user = user.customers.sample

  quotes << Quote.create!(
      quote_number: nil,
      invoice_number: "#{customer_of_user.first_name[0]}#{customer_of_user.last_name[0]}#{random_date.strftime("%d%m%Y%H%M%S")}#{i}",
      amount: rand(250..5000),
      discount: 0,
      quote_sending_date: nil,
      invoice_sending_date: random_date,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: true,
      is_paid: true,
      user: user,
      customer: customer_of_user)

  puts "Preview #{i+1} invoices (paid) generated"
end

2.times do |i|

  random_date = rand(7.days).seconds.ago
  customer_of_user = user.customers.sample

  quotes << Quote.create!(
      quote_number: nil,
      invoice_number: "#{customer_of_user.first_name[0]}#{customer_of_user.last_name[0]}#{random_date.strftime("%d%m%Y%H%M%S")}#{i}",
      amount: rand(250..5000),
      discount: 0,
      quote_sending_date: nil,
      invoice_sending_date: random_date,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: true,
      is_paid: true,
      user: user,
      customer: customer_of_user)

  puts "Preview #{i+1} invoices (paid) generated"
end

2.times do |i|

  random_date = rand(6.months).seconds.ago
  customer_of_user = user.customers.sample

  quotes << Quote.create!(
      quote_number: nil,
      invoice_number: "#{customer_of_user.first_name[0]}#{customer_of_user.last_name[0]}#{random_date.strftime("%d%m%Y%H%M%S")}#{i}",
      amount: rand(250..5000),
      discount: 0,
      quote_sending_date: nil,
      invoice_sending_date: random_date,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: true,
      is_paid: false,
      user: user,
      customer: customer_of_user)

  puts "Preview #{i+1} invoices (unpaid) generated"
end

60.times do |i|
  JoinGoodsQuotesTable.create!(
      good: user.goods.sample,
      quote: user.quotes.sample)

  puts "Preview #{i+1} joints between goods and quotes generated"
end