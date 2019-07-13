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

FactoryBot.define do
  factory :topic do
    name        { 'Faker::Book.title' }
    description { 'Faker::Book.genre' }
  end
end
