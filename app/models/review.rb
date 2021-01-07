class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options presence: true do
    validates :recommend_score
    validates :taste
    validates :scent
    validates :comment, length: { maximum: 1000 }
  end

  validates :otsumami, length: { maximum: 200 }

  validates :recommend_score, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: 'は1~5の範囲で選択してください', allow_blank: true }
  validates :taste, numericality: { greater_than_or_equal_to: -5, less_than_or_equal_to: 5, message: 'は-5~5の範囲で選択してください', allow_blank: true }
  validates :scent, numericality: { greater_than_or_equal_to: -5, less_than_or_equal_to: 5, message: 'は-5~5の範囲で選択してください', allow_blank: true }
end
