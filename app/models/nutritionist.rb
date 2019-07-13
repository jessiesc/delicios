# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class Nutritionist < User
  has_one :profile, class_name:  NutritionistProfile.name,
                    inverse_of:  :user,
                    foreign_key: :user_id,
                    dependent:   :destroy

  has_many :articles, inverse_of:  :author,
                      foreign_key: :user_id,
                      dependent:   :destroy

  accepts_nested_attributes_for :profile,
                                reject_if:     :all_blank,
                                allow_destroy: true
end
