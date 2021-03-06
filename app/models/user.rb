class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birth
  end
end