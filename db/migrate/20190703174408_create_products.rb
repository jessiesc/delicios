class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category
      t.integer :kal

      t.timestamps
    end
  end
end
