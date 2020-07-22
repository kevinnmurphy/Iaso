# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

f = User.create(name: "qwer", password: "qwer", email: "qwer@qwer.com")
f.foods.create(name: "apple", calories: 150, carbs: 15, fats: 8, proteins: 25)
f.meals.create(name: "breakfast")
f.foodlogs.create(quantity: 2, foods_id: 1, meals_id: 1)

# 10.times do
#     user_data = {
#     name: Faker::Name.name,
#     password: "qwer",
#     email: "123@123.com"
#     }
#     u = User.create(user)
# end

# 20.times do
#     food_data = {
#         name: Faker::Food.dish,
#         calories: rand(150),
#         carbs: rand(15),
#         fats: rand(15),
#         proteins: rand(15)
#     }
#     f = Food.create(food_data)
# end

# 10.times do
#     user = User.all.first
#     food = Food.all.sample
#     food = foods.sample
#     data = {
#         user_id: user.id,
#         food_id: food.id,
#         food: food
#     }
#     Meal.create(data)
# end
