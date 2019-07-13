# frozen_string_literal: true

# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :integer
#  user_id    :bigint
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Article, type: :model do
  subject(:article) { FactoryBot.build(:article) }

  describe 'Validations' do
    it { should validate_length_of(:content).is_at_least(Article::CONTENT_MIN_LENGTH) }
    it { should validate_length_of(:content).is_at_most(Article::CONTENT_MAX_LENGTH) }

    it { should validate_length_of(:title).is_at_least(Article::TITLE_MIN_LENGTH) }
    it { should validate_length_of(:title).is_at_most(Article::TITLE_MAX_LENGTH) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  describe 'Associations' do
    it { is_expected.to belong_to(:topic) }
  end
end
