class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.text :price,             null: false
      t.string :info,            null: false
      t.text :size,              null: false
      t.integer :alcohol_degree, null: false
      t.integer :category_id,    null: false
      t.integer :rice_id,        null: false
      t.integer :method_id
      t.integer :kuramoto_id,    null: false
      t.integer :prefecture_id,  null: false
      t.text :delivery_method,   null: false
      t.timestamps
    end
  end
end
