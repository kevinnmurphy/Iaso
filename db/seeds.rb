# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# u = User.create(name: "qwer", password: "qwer", email: "qwer@qwer.com")

# m = u.meals.build(name: "breakfast")

# f = u.foods.build(name: "Apple", calories: 70, carbs: 9, fats: 0, proteins: 2)
# u.foods.build(name: "Orange", calories: 90, carbs: 15, fats: 2, proteins: 3)
# u.foods.build(name: "Banana", calories: 50, carbs: 20, fats: 1, proteins: 1)

# u.meals.first.foodlogs.build(quantity: 2, food_id: f.id, meal_id: m.id)

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
#     u.foods.build(food_data)
#     # f = Food.create(food_data)
# end

# 10.times do
#     # user = User.all.first
#     user  = u
#     food = Food.all.sample
#     # meal = foods.sample
#     meal = m
#     data = {
#         user_id: user.id,
#         food_id: food.id,
#         food: food
#     }
#     m.foodlogs.create(data)
#     # Meal.create(data)
# end
