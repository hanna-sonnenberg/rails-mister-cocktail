# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
objs = JSON.parse(json)
# puts objs["drinks"]
objs['drinks'].each do |obj|
  # puts obj
  Ingredient.create(name: obj['strIngredient1'])
end


# CREATE more Ingredients
ice = Ingredient.create(name: 'ice')
coconut_milk = Ingredient.create(name: 'coconut milk')
pineapple_chunks = Ingredient.create(name: 'pineapple chunks')
brown_sugar = Ingredient.create(name: 'brown sugar')
orange_juice = Ingredient.create(name: 'orange juice')
club_soda = Ingredient.create(name: 'club soda')
coconut_cream = Ingredient.create(name: 'coconut cream')
worcestershire_sauce = Ingredient.create(name: 'worcestershire sauce')
hot_souce = Ingredient.create(name: 'hot sauce')
pepper = Ingredient.create(name: 'pepper')
celery_salt = Ingredient.create(name: 'celery salt')
honey_simple_syrup = Ingredient.create(name: 'honey simple syrup')
mint_leaves = Ingredient.create(name: 'mint leaves')


# CREATE Cocktails name

puts "Creating Cocktails"

pina_colada = { name: 'Pina Colada', photo_path: 'https://res.cloudinary.com/dglozciyx/image/upload/v1606058252/c5n5gegg6i5septp9jzl59gv8ipt.jpg' }
mai_tai = { name: 'Mai Tai', photo_path: 'https://res.cloudinary.com/dglozciyx/image/upload/v1606058263/11zqlccgkq1xjpvjsdowv0q3xd28.jpg' }
bloody_mary = { name: 'Bloody Mary', photo_path: 'https://res.cloudinary.com/dglozciyx/image/upload/v1606058267/2xiwm3w86qxz56tw1z6xs3x4ec55.jpg' }
mojito = { name: 'Mojito', photo_path: 'https://res.cloudinary.com/dglozciyx/image/upload/v1606058270/4zbqbx6y5vhvgvgmdypb7qj4xaa0.jpg' }

[pina_colada, mai_tai, bloody_mary, mojito].each do |attributes|
  file = URI.open(attributes[:photo_path])
  cocktail = Cocktail.create(name: attributes[:name])
  cocktail.photo.attach(io: file, filename: 'cocktails.jpg', content_type: 'image/jpeg')
  puts "Created #{cocktail.name}"
end

puts "Finished"


