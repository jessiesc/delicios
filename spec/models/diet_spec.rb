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

require 'rails_helper'

RSpec.describe Diet, type: :model do
  let!(:diet) { FactoryBot.create(:diet) }
  let!(:attributes) { %i[name description] }

  it 'has attributes' do
    expect(diet).to respond_to(*attributes)
  end

  it 'has a valid factory' do
    expect(diet).to be_valid
  end

  # describe 'associations' do
  # it { should have_many(:recommendations).class_name('Product') }
  # it { should have_many(:restrictions).class_name('Product') }
  # end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:description).is_at_most(1_000) }
  end
end
