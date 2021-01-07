class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer      :taste,              null: false
      t.integer      :scent,              null: false
      t.float        :recommend_score,    null: false
      t.string       :otsumami
      t.string       :comment,            null: false
      t.references   :user,               null: false
      t.references   :item,               null: false
      t.timestamps
    end
  end
end
