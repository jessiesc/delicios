# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  category   :integer
#  kal        :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Product < ApplicationRecord
  MAX_NAME_LENGTH = 30
  CATEGORIES      = %i[plant_products animal_products meat fish vegetables fruits mushrooms].freeze

  has_many :ingredients
  has_many :recipes, through: :ingredients

  validates :name, :category, :kal, presence: true
  validates :name, length: { maximum: MAX_NAME_LENGTH }

  enum category: CATEGORIES
end
