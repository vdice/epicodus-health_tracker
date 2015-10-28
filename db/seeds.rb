# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@foods = %w(Banana Orange Apple Pear Kumquat Brussel\ Sprouts Pineapple Hamburger Ice\ Cream Steak Sushi)
@exercises = %w(Running Biking Hiking Swimming Walking Surfing Jogging Bench\ Press Squats Fishing Golfing )
@calories = [100, 20, 40, 500, 35, 25, 1, 5, 90, 75, 45, 105, 15, 10]
i = 0
for i in 0..@foods.count do
  Food.create(name: @foods[i], calorie_count: CalorieCount.create( count: @calories[i], countable_type: "Food" ))
  Exercise.create(name: @exercises[i], calorie_count: CalorieCount.create( count: @calories[i], countable_type: "Exercise" ))
  i += 1
end
