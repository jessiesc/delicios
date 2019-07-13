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

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject(:recipe) { FactoryBot.build(:recipe) }

  describe Product, type: :model do
    context 'relations' do
      it { is_expected.to have_many(:ingredients) }
      it { is_expected.to have_many(:products).through(:ingredients) }
    end

    context 'validations' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:preparation_kind) }
      it { is_expected.to validate_presence_of(:preparation_time) }
      it { is_expected.to validate_length_of(:name).is_at_most(Recipe::MAX_NAME_LENGTH) }

      it do
        is_expected.to validate_length_of(:description)
          .is_at_most(Recipe::MAX_DESCRIPTION_LENGTH)
      end
    end
  end
end
