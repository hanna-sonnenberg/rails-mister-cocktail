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

pina_colada = { name: 'Pina Colada' }
mai_tai = { name: 'Mai Tai' }
bloody_mary = { name: 'Bloody Mary' }
mojito = { name: 'Mojito' }

[pina_colada, mai_tai, bloody_mary, mojito].each do |attributes|
  cocktail = Cocktail.create(attributes)
  puts "Created #{cocktail.name}"
end

puts "Finished"

# CREATE cocktails with doses and ingredients
# pina_colada_cocktail = Cocktail.create(pina_colada)

# CREATE dose
# Dose.create(description: '1/4 cup', ingredient_id: ice.id, cocktail_id: pina_colada_cocktail.id)








