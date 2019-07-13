# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  category   :integer
#  kal        :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  subject(:product) { FactoryBot.build(:product) }

  describe Product, type: :model do
    context 'relations' do
      it { is_expected.to have_many(:ingredients) }
      it { is_expected.to have_many(:recipes).through(:ingredients) }
    end

    context 'validations' do
      it { is_expected.to validate_presence_of(:name) }
      it { is_expected.to validate_presence_of(:category) }
      it { is_expected.to validate_presence_of(:kal) }
      it { is_expected.to validate_length_of(:name).is_at_most(Product::MAX_NAME_LENGTH) }
    end
  end
end
