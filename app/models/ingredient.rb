# frozen_string_literal: true

# == Schema Information
#
# Table name: ingredients
#
#  id         :bigint           not null, primary key
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  recipe_id  :bigint
#
# Indexes
#
#  index_ingredients_on_product_id  (product_id)
#  index_ingredients_on_recipe_id   (recipe_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (recipe_id => recipes.id)
#

class Ingredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :product

  validates :weight, presence: true
end
