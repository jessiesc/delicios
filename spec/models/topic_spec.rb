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

require 'rails_helper'

RSpec.describe Topic, type: :model do
  # subject { described_class.new(name: 'Diet', description: 'all about diets') }
  subject(:topic) { FactoryBot.build(:topic) }

  describe 'Validations' do
    it { should validate_length_of(:description).is_at_least(Topic::DESCRIPTION_MIN_LENGTH) }
    it { should validate_length_of(:description).is_at_most(Topic::DESCRIPTION_MAX_LENGTH) }

    it { should validate_length_of(:name).is_at_least(Topic::NAME_MIN_LENGTH) }
    it { should validate_length_of(:name).is_at_most(Topic::NAME_MAX_LENGTH) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe 'Associations' do
    it { is_expected.to have_many(:articles) }
  end
end
