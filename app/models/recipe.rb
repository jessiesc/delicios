# frozen_string_literal: true

# == Schema Information
#
# Table name: recipes
#
#  id               :bigint           not null, primary key
#  description      :text
#  name             :string
#  preparation_kind :integer
#  preparation_time :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Recipe < ApplicationRecord
  MAX_NAME_LENGTH        = 30
  MAX_DESCRIPTION_LENGTH = 500
  PREPARATION_KINDS      = %i[frying steaming baking freshing].freeze

  has_many :products, through: :ingredients
  has_many :ingredients

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :name,        :preparation_kind,
            :description, :preparation_time, presence: true

  validates :description, length: { maximum: MAX_DESCRIPTION_LENGTH }
  validates :name,        length: { maximum: MAX_NAME_LENGTH }

  enum preparation_kind: PREPARATION_KINDS
end
