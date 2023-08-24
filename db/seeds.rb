require 'open-uri'
require 'nokogiri'

puts 'Cleaning up database...'
Duck.destroy_all
Booking.destroy_all
User.destroy_all
puts 'Database cleaned'

User.create(
  first_name: 'Gerard',
  last_name: 'Bernard',
  email: 'gg@gmail.com',
  location: 'Tour Eiffel',
  password: 'qwertyuiop'
)

User.create(
  first_name: 'Jo-Willfried',
  last_name: 'Tsonga',
  email: 'jojo@gmail.com',
  location: 'Merignac',
  password: 'qwertyuiop'
)

User.create(
  first_name: 'Mamie',
  last_name: 'Gateau',
  email: 'mamiegateau@gmail.com',
  location: '107 Cr Balguerie Stuttenberg, 33300 Bordeaux',
  password: 'qwertyuiop'
)

User.create(
  first_name: 'Emmanuel',
  last_name: 'Macron',
  email: 'manu@gmail.com',
  location: 'Av. des Champs-Élysées, 75008 Paris',
  password: 'qwertyuiop'
)

User.create(
  first_name: 'Bob',
  last_name: 'Lebricoleur',
  email: 'boblebricoleur@gmail.com',
  location: '118 Rue du Jardin public, 33300 Bordeaux',
  password: 'qwertyuiop'
)

puts "Si cela n'est pas fait"
puts '=> va creer un utilisateur'
puts 'Via la route /users/sign_up'
puts 'Sinon tu vas avoir une erreur ci dessous :P'

puts 'Create ducks...'
categories = %w[sonic horreur super-heros]

categories.each do |category|
  url = "https://www.coincaillerie.com/#{category}"

  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  html_doc.search('.sFJHatI').each do |element|
    txt = element.text
    if (txt.include?('Canard ') && txt.first(2) == 'Ca')
      txt = txt.downcase.gsub(/\s+/, '-')

      new_url = "https://www.coincaillerie.com/product-page/#{txt}"
      new_html_file = URI.open(new_url).read
      new_html_doc = Nokogiri::HTML.parse(new_html_file)

      name = new_html_doc.search('._2qrJF').map(&:text).first
      if !name.nil?
        p name
        description = new_html_doc.search('._28cEs p').map(&:text).first
        url = new_html_doc.search('._3ggop img').attribute("src").value
        url = url.split('/')[0..4].join('/') if url.split('/').length != 5

        Duck.create!(
          name: name,
          description: description.blank? ? "Fausse description" : description,
          price: (10..25).to_a.sample,
          category: category,
          available: [true, false].sample,
          height: 10,
          width: 10,
          depth: 10,
          user_id: ((User.last.id - 4)..User.last.id).to_a.sample,
          rating: (1..10).to_a.sample,
          url: url
        )
        puts 'Duck create!'
      end
    end
  end
end

# -------------- RANDOM BOOKINGS SEED
puts 'Booking seed Lauch => Fasten your belts Motherfucker !'
random_bookings_seed = (2..6).to_a.sample
p "random_bookings_seed => #{random_bookings_seed}"
ducks_id = (0..33).step(random_bookings_seed).to_a.shuffle
p "sufling the bookings id => #{ducks_id}"
ducks_id.each do |id|
  Booking.create(
    user_id: ((User.last.id - 4)..User.last.id).to_a.sample,
    duck_id: id
  )
  puts "Booking create!"
end
p "#{ducks_id.length} new random bookings has been created ! (for user_id:1)"
