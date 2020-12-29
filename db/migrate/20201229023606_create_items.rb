class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,               null: false
      t.text :price,                null: false
      t.string :info,               null: false
      t.text :size,                 null: false
      t.text :alcohol_degree,       null: false
      t.references :category,       null: false, foreign_key: true
      t.references :rice,           null: false, foreign_key: true
      t.references :storage_method, null: false, foreign_key: true
      t.references :kuramoto,       null: false, foreign_key: true
      t.integer :prefecture_id,     null: false
      t.text :delivery_method,      null: false

      t.timestamps
    end
  end
end
