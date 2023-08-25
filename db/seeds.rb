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
  url: 'https://i.la-croix.com/729x486/smart/2020/11/27/1201126922/Jai-horreur-appelle-seniors-Papy_0.jpg',
  location: 'Tour Eiffel',
  password: 'qwertyuiop'
)

User.create(
  first_name: 'Jo-Willfried',
  last_name: 'Tsonga',
  email: 'jojo@gmail.com',
  url: 'https://static.actu.fr/uploads/2022/05/28b9810de87593358b1905bb8b0ec0b6482b4ec0.jpg',
  location: 'Place de la Bourse',
  password: 'qwertyuiop'
)

User.create(
  first_name: 'Mamie',
  last_name: 'Gateau',
  email: 'mamiegateau@gmail.com',
  url: 'https://media2.woopic.com/api/v1/images/2115%2Fwebedia-articles%2F7ae%2Fb5c%2F067fc2d2d7c8c16b33d164601b%2F1584060-si-vous-aimez-confectionner-de-bons-peti-orig-1.jpeg?facedetect=1&quality=85',
  location: 'La Victoire',
  password: 'qwertyuiop'
)

User.create(
  first_name: 'Emmanuel',
  last_name: 'Macron',
  email: 'manu@gmail.com',
  url: 'https://media-mcetv.ouest-france.fr/wp-content/uploads/2020/09/rentree-2020-emmanuel-macron-fait-une-grosse-faute-de-francais_.jpg',
  location: 'Arc de Triomphe',
  password: 'qwertyuiop'
)

User.create(
  first_name: 'Bob',
  last_name: 'Lebricoleur',
  email: 'boblebricoleur@gmail.com',
  url: 'https://fr.web.img5.acsta.net/c_310_420/medias/nmedia/18/69/18/59/18865095.jpg',
  location: 'Place du Parlement',
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
