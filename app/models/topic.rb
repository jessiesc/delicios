# frozen_string_literal: true

# == Schema Information
#
# Table name: topics
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Topic < ApplicationRecord
  NAME_MAX_LENGTH        = 20
  NAME_MIN_LENGTH        = 1
  DESCRIPTION_MAX_LENGTH = 100
  DESCRIPTION_MIN_LENGTH = 1

  has_many :articles

  validates :name, :description, presence: true

  validates :name,        length: { in: NAME_MIN_LENGTH..NAME_MAX_LENGTH }
  validates :description, length: { in: DESCRIPTION_MIN_LENGTH..DESCRIPTION_MAX_LENGTH }
end
