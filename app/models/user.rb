class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }
 PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: PASSWORD_REGEX }
 NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  validates :family_name, :first_name, presence:true, format: { with: NAME_REGEX }
 KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :family_name_kana, :first_name_kana, presence:true, format: { with: KANA_REGEX }
  validates :birth, presence: true
end
