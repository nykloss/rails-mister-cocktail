# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)\
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

require "json"
require "open-uri"
response = open("https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list")
json = JSON.parse(response.read)
array = json['drinks']
puts "start seeding"
array.each do |x|
ingredients = Ingredient.create(name: x["strIngredient1"])
puts "#{ingredients.name}"
end
puts "done seeding"

test_cocktail = Cocktail.new(name: 'whisky sour', remote_photo_url: "https://static.essen-und-trinken.de/bilder/d6/ed/58699/galleryimage/whiskeysour.jpg")
test_cocktail.save


