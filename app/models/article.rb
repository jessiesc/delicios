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

class Article < ApplicationRecord
  TITLE_MAX_LENGTH   = 100
  TITLE_MIN_LENGTH   = 1
  CONTENT_MAX_LENGTH = 1_000
  CONTENT_MIN_LENGTH = 1

  belongs_to :topic
  belongs_to :author, class_name: User.name, foreign_key: :user_id

  validates :title, :content, :user_id, presence: true

  validates :title,   length: { in: TITLE_MIN_LENGTH..TITLE_MAX_LENGTH }
  validates :content, length: { in: CONTENT_MIN_LENGTH..CONTENT_MAX_LENGTH }
end
