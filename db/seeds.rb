# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: 'Nader',
  email: 'nader@example.com',
  password: '123456'
)

Recipe.create(
  title: 'Mini Meatloaves',
  description: 'Quick and easy to make. A family favorite. The ketchup and brown sugar give these loaves a tangy flavor.',
  ingredients: '1 egg
                3/4 cup milk1 cup shredded Cheddar cheese
                1/2 cup quick cooking oats
                1 teaspoon salt1 pound ground beef
                2/3 cup ketchup
                1/4 cup packed brown sugar
                1 1/2 teaspoons prepared mustard',
  directions: 'Preheat oven to 350 degrees F (175 degrees C).
                In a large bowl, combine the egg, milk, cheese, oats and salt. Add the ground beef, mixing well, and form this mixture into eight miniature meatloaves. Place these in a lightly greased 9x13 inch baking dish.
                In a separate small bowl, combine the ketchup, brown sugar and mustard. Stir thoroughly and spread over each meatloaf.
                Bake, uncovered, at 350 degrees F (175 degrees C) for 45 minutes.'
)

Recipe.create(
  title: 'Turkey Sliders',
  description: 'Mini turkey burgers made with goat cheese and sun-dried tomatoes! This recipe makes great regular sized burgers, too!',
  ingredients: '1 pound ground turkey
                1/3 cup goat cheese
                1/4 cup sun-dried tomatoes packed in oil, drained and chopped
                1 clove garlic, minced
                1/2 cup panko bread crumbs
                1/4 teaspoon salt
                1/4 teaspoon ground black pepper
                1/8 teaspoon hot chili flakes (optional)
                1/4 cup all-purpose flour
                1/4 cup olive oil
                1/2 cup white wine1
                6 mini dinner rolls',
  directions: 'Mix the ground turkey, goat cheese, sun-dried tomatoes, garlic, panko bread crumbs, salt, pepper, and hot chili flakes together in a large bowl with your hands until evenly mixed. Form the mixture into patties about 3-inches in diameter. Dust each patty lightly with flour on each side. This will allow patties to brown nicely in oil.
              Heat the olive oil in a large skillet over medium-high heat; cook the patties in the hot oil until browned, 2 to 3 minutes per side. Pour the white wine over the patties, place a cover over the skillet, and continue cooking until the sliders are no longer pink inside and the juices run clear, about 5 minutes. Remove the sliders to a plate lined with paper towels to drain. Serve on the mini dinner rolls.'
)
