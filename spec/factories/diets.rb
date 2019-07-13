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

FactoryBot.define do
  factory :diet do
    name        { 'MyString' }
    description { 'MyString' }
  end
end
