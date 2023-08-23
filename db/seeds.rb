require 'open-uri'
require 'nokogiri'

puts 'Cleaning up database...'
Duck.destroy_all
puts 'Database cleaned'

# 5.times do
#   Duck.create(
#     name: 'Gerard',
#     description: 'I am a little cute rubber duck',
#     price: 25,
#     category: 'sonic',
#     available: true,
#     height: 10,
#     width: 10,
#     depth: 10,
#     user_id: 1
#   )
# end

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

        Duck.create!(
          name: name,
          description: description,
          price: 25,
          category: category,
          available: true,
          height: 10,
          width: 10,
          depth: 10,
          user_id: 1,
          rating: 9,
          url: url
        )
        puts "Duck create!"
      end
    end
  end
end
