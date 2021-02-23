class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, presence: true
  #  validates :email,    uniqueness: true, format: {with: /¥/} # @を含む
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '半角アルファベットと半角数字の2種類を使用して、6文字以上で入力してください。'
  with_options presence: true, length: { maximum: 5 }, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字で入力してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, length: { maximum: 10 }, format: { with: /\A[ァ-ヶ]+\z/, message: '全角カタカナで入力してください' } do
    validates :first_name_reading
    validates :last_name_reading
  end
  validates :birthday, presence: true

end
