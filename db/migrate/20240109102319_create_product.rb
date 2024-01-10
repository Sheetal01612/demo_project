class CreateProduct < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.float :price

      t.timestamps
    end
  end
end
