user1 = User.create!(name: 'User1')

apple = user1.foods.create!(name: 'Apple', measurement_unit: 1, price: 2)
pineapple = user1.foods.create!(name: 'Pineapple', measurement_unit: 1, price: 4)
chicken_breasts = user1.foods.create!(name: 'Chicken Breasts', measurement_unit: 1, price: 6)