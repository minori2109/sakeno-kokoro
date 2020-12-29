class CreateKuramotos < ActiveRecord::Migration[6.0]
  def change
    create_table :kuramotos do |t|
      t.string      :name, null: false

      t.timestamps
    end
  end
end
