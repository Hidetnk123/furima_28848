class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true,
                    uniqueness: true,
                    format: {with: VALID_EMAIL_REGEX}}
  validates :password, {presence: true,
                       length: { minimum: 6 },
                       confirmation: true,
                       format: { with: /\A[a-zA-Z0-9]+\z/, message: "半角英数混合で記入お願いします" }}
  validates :last_name, :first_name, {presence: true,
                                    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角（漢字・ひらがな・カタカナ）で記入お願いします" }}
  validates :katakana_last_name, :katakana_first_name, {presence: true,
                                                      format: { with: /\A[ァ-ヶー－]+\z/, message: "全角（カタカナ）で記入お願いします" }}
  validates :birth, presence: true
end
