# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name      { 'Name' }
    category  { 'fish' }
    kal       { 1 }
  end
end
