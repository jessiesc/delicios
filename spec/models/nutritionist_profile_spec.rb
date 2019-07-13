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

require 'rails_helper'

RSpec.describe NutritionistProfile, type: :model do
  it 'should contain required fields' do
    expect(subject).to have_attribute :first_name
    expect(subject).to have_attribute :last_name
    expect(subject).to have_attribute :work
    expect(subject).to have_attribute :birthday
    expect(subject).to have_attribute :how_heard
    expect(subject).to have_attribute :experience_years
  end
end
