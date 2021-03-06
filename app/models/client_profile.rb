# frozen_string_literal: true

# == Schema Information
#
# Table name: client_profiles
#
#  id         :bigint           not null, primary key
#  birthday   :date
#  first_name :string
#  how_heard  :string
#  last_name  :string
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_client_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class ClientProfile < ApplicationRecord
  belongs_to :user, class_name: Client.name, inverse_of: :profile
end
