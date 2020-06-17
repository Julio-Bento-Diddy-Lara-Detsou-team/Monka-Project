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
      quote_number: "#{customer_of_user.first_name[0]}#{customer_of_user.last_name[0]}#{random_date.strftime("%d%m%Y")}",
      invoice_number: nil,
      amount: 0,
      discount: 0,
      quote_sending_date: random_date,
      invoice_sending_date: nil,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: false,
      is_paid: false,
      paid_date: nil,
      user: user,
      customer: customer_of_user)

  puts "Preview #{i+1} quotes_old generated"
end

6.times do |i|

  random_date = rand(6.months).seconds.ago
  customer_of_user = user.customers.sample

  quotes << Quote.create!(
      quote_number: nil,
      invoice_number: "#{customer_of_user.first_name[0]}#{customer_of_user.last_name[0]}#{random_date.strftime("%d%m%Y")}",
      amount: 0,
      discount: 0,
      quote_sending_date: nil,
      invoice_sending_date: random_date - 7.days,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: true,
      is_paid: true,
      paid_date: random_date + 7.days,
      user: user,
      customer: customer_of_user)

  puts "Preview #{i+1} invoices (paid) generated"
end

2.times do |i|

  random_date = rand(7.days).seconds.ago
  customer_of_user = user.customers.sample

  quotes << Quote.create!(
      quote_number: nil,
      invoice_number: "#{customer_of_user.first_name[0]}#{customer_of_user.last_name[0]}#{random_date.strftime("%d%m%Y")}",
      amount: 0,
      discount: 0,
      quote_sending_date: nil,
      invoice_sending_date: random_date - 4.days,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: true,
      is_paid: true,
      paid_date: random_date + 3.days,
      user: user,
      customer: customer_of_user)

  puts "Preview #{i+1} invoices (paid) generated"
end

2.times do |i|

  random_date = rand(6.months).seconds.ago
  customer_of_user = user.customers.sample

  quotes << Quote.create!(
      quote_number: nil,
      invoice_number: "#{customer_of_user.first_name[0]}#{customer_of_user.last_name[0]}#{random_date.strftime("%d%m%Y")}",
      amount: 0,
      discount: 0,
      quote_sending_date: nil,
      invoice_sending_date: random_date,
      quote_sending_counter: 0,
      invoice_sending_counter: 0,
      is_invoice: true,
      is_paid: false,
      paid_date: nil,
      user: user,
      customer: customer_of_user)

  puts "Preview #{i+1} invoices (unpaid) generated"
end

60.times do |i|
  JoinGoodsQuotesTable.create!(
      good: user.goods.sample,
      quote: user.quotes.sample)

  puts "Preview #{i+1} joints between goods and quotes_old generated"
end

Quote.all.each do |quote|
  total_amount = 0

  quote.goods.each do |good|
    total_amount += good.price * good.quantity
  end

  total_amount
  quote.update(amount: total_amount)

  puts "Preview quote amount updated depending on the joint table"
end
