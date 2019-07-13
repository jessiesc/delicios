# frozen_string_literal: true

# == Schema Information
#
# Table name: nutritionist_profiles
#
#  id               :bigint           not null, primary key
#  birthday         :date
#  experience_years :integer
#  first_name       :string
#  how_heard        :string
#  last_name        :string
#  work             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :bigint
#
# Indexes
#
#  index_nutritionist_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class NutritionistProfile < ApplicationRecord
  belongs_to :user, class_name: Nutritionist.name, inverse_of: :profile
end
