class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :recommend_score
    validates :taste
    validates :scent
    validates :comment
    validates :user_id
    validates :item_id
  end
end
