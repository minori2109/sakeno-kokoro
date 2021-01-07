class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :category
  belongs_to :rice
  belongs_to :storage_method
  belongs_to :kuramoto

  has_many :reviews, dependent: :destroy

  # 画像の添付
  has_one_attached :image

  # バリデーション
  with_options presence: { message: 'を入力してください' } do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1_000 }
    validates :size, length: { maximum: 20 }
    validates :alcohol_degree, length: { maximum: 20 }
    validates :prefecture_id
    validates :delivery_method, length: { maximum: 40 }
    validates :price
  end

  validates :price, numericality: { only_integer: true, message: 'は半角数字で入力してください', allow_blank: true }
  validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999, message: 'は1~9,999,999円の範囲で入力してください', allow_blank: true }
end
