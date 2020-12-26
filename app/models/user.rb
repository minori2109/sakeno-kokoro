class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)\w{6,}\z/.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', allow_blank: true }

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  with_options presence: { message: 'を入力してください' } do
    validates :nickname
    validates :last_name, format: { with: VALID_NAME_REGEX, message: 'は全角で入力してください', allow_blank: true }
    validates :first_name, format: { with: VALID_NAME_REGEX, message: 'は全角で入力してください', allow_blank: true }
    validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: 'は全角カタカナで入力してください', allow_blank: true }
    validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX, message: 'は全角カタカナで入力してください', allow_blank: true }
    validates :birthday
  end
end
