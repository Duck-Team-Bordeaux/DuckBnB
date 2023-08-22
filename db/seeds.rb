require 'open-uri'
require 'nokogiri'

puts 'Cleaning up database...'
Duck.destroy_all
puts 'Database cleaned'

5.times do
  Duck.create(
    name: 'Gerard',
    description: 'I am a little cute rubber duck',
    price: 25,
    category: 'sonic',
    available: true,
    height: 10,
    width: 10,
    depth: 10,
    users_id: 1
  )
end
# puts 'Create ducks...'
# categories = 'sonic'
# url = 'https://www.coincaillerie.com/sonic'

# html_file = URI.open(url).read
# html_doc = Nokogiri::HTML.parse(html_file)

# ducks_array_sonic = []

# html_doc.search('.sGhQxc2').each do |element|
#   ducks_array_sonic << element.text if element.text.include?('Canard ')
# end

# ducks_array_sonic.map! { |duck| duck.downcase.gsub(/\s+/, '-') }
# ducks_array_sonic.delete_at(5)
# p ducks_array_sonic

# ducks_array_sonic.each do |duck|
#   url_array = "https://www.coincaillerie.com/product-page/#{duck}"
#   p url_array
#   html_file_oui = URI.open(url_array).read
#   html_doc_oui = Nokogiri::HTML.parse(html_file_oui)

#   name = html_doc_oui.search('._2qrJF').map(&:text).first
#   description = html_doc_oui.search('._28cEs p').map(&:text).first

#   Duck.create(
#     name: name,
#     description: description,
#     price: 25,
#     category: 'sonic',
#     available: true,
#     height: 10,
#     weight: 10,
#     depth: 10
#   )
# end
