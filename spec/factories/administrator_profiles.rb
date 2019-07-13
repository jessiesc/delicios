# frozen_string_literal: true

# == Schema Information
#
# Table name: administrator_profiles
#
#  id         :bigint           not null, primary key
#  first_name :string
#  last_name  :string
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_administrator_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

FactoryBot.define do
  factory :administrator_profile do
    first_name    { 'MyString' }
    last_name     { 'MyString' }
    nickname      { 'MyString' }
    administrator { user_id }
  end
end
