# frozen_string_literal: true

FactoryBot.define do
  factory :recipe do
    name              { 'Name' }
    description       { 'Description' }
    preparation_kind  { 'frying' }
    preparation_time  { 1 }
  end
end
