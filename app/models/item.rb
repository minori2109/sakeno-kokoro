class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :category
  belongs_to :rice
  belongs_to :storage_method
  belongs_to :kuramoto

  # 画像の添付
  has_one_attached :image

  # バリデーション
  with_options presence: { message: 'を入力してください' } do
    validates :name
    validates :info
    validates :size
    validates :alcohol_degree
    validates :prefecture_id
    validates :delivery_method
    validates :price
  end

end
