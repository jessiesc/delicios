class CreateClientProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :client_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.date :birthday
      t.string :how_heard
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
