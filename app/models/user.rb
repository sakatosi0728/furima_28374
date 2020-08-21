class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, format: { with: regex_mail}
  validates :family_name, presence: true, format: { with: regex_name}
  validates :first_name, presence: true, format: { with: regex_name}
  validates :family_name_kana, presence: true, format: { with: regex_kana}
  validates :first_name_kana, presence: true, format: { with: regex_kana}
  validates :birthday, presence: true

  regex_mail = /\A\S+@\S+\.\S+\z/
  regex_name = /\A[ぁ-んァ-ン一-龥]/
  regex_kana = /\A[ァ-ヶー－]+\z/

end
