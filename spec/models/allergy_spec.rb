# frozen_string_literal: true

# == Schema Information
#
# Table name: allergies
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Allergy, type: :model do
  let!(:allergy) { FactoryBot.create(:allergy) }
  let!(:attributes) { %i[name description] }

  it 'has attributes' do
    expect(allergy).to respond_to(*attributes)
  end

  it 'has a valid factory' do
    expect(allergy).to be_valid
  end

  # describe 'associations' do
  #  it { should have_many(:restrictions).class_name('Product') }
  # end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_length_of(:description).is_at_most(1_000) }
  end
end
