class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :category
  belongs_to :rice
  belongs_to :storage_method
  belongs_to :kuramoto
end
