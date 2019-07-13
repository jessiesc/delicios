100.times do
  Product.create(
    name: Faker::Food.ingredient,
    category: Product.categories.keys.sample,
    kal: Faker::Number.non_zero_digit
  )
end

products = Product.all
preparation_kinds = Recipe.preparation_kinds.keys
100.times do
  recipe = Recipe.create!(
    name: Faker::Food.dish,
    description: Faker::Food.description,
    preparation_kind: preparation_kinds.sample,
    preparation_time: Faker::Number.non_zero_digit
  )

  rand(1..5).times do
    recipe.ingredients.create(
      weight: Faker::Number.non_zero_digit,
      product: products.sample
    )
  end
end
