class CreateAdministratorProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :administrator_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
