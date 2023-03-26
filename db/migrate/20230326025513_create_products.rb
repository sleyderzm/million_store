class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.float :price
      t.float :discount_percentage
      t.float :rating
      t.integer :stock
      t.string :brand
      t.references :product_category, null: false, foreign_key: true
      t.string :thumbnail
      t.string :external_api
      t.string :external_id

      t.timestamps
    end
  end
end
