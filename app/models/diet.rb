# frozen_string_literal: true

# == Schema Information
#
# Table name: diets
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Diet < ApplicationRecord
  NAME_MAX_LENGTH        = 50
  DESCRIPTION_MAX_LENGTH = 1_000

  # TODO: Add restrictions relation

  # has_many :recommendations, class_name: 'Product'
  # has_many :restrictions, class_name: 'Product'

  validates :name, :description, presence: true

  validates :name,        length: { maximum: NAME_MAX_LENGTH }
  validates :description, length: { maximum: DESCRIPTION_MAX_LENGTH }
end
