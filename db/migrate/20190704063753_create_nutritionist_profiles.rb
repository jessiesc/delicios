class CreateNutritionistProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :nutritionist_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :work
      t.date :birthday
      t.integer :experience_years
      t.string :how_heard
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
