class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.integer :preparation_kind
      t.integer :preparation_time

      t.timestamps
    end
  end
end
