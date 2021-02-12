class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :item

  #ユーザーに同じ商品を複数回お気に入り登録させないため
  validates_uniqueness_of :item_id, scope: :user_id
end
