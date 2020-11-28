class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ン]+\z/.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: VALID_NAME_REGEX,
                           message: 'は全角（漢字・ひらがな・カタカナ）で入力してください。' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: VALID_NAME_KANA_REGEX,
                           message: 'は全角（カタカナ）で入力してください。' } do
      validates :katakana_last_name
      validates :katakana_first_name
    end
  end

  validates :password, format: { with: VALID_PASSWORD_REGEX,
                                 message: 'is include both letters and numbers' }
end
