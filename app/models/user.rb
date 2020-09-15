class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchase_histories

  with_options presence: true do
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    number = /\A[a-zA-Z0-9]+\z/
    full_width = /\A[ぁ-んァ-ン一-龥]/
    full_width_kana = /\A[ァ-ヶー－]+\z/
    validates :nickname, :birth
    validates :email, {uniqueness: true, format: {with: VALID_EMAIL_REGEX}}
    validates :password, {length: { minimum: 6 }, confirmation: true, format: { with: number }}
    validates :last_name, :first_name, format: { with: full_width }
    validates :katakana_last_name, :katakana_first_name, format: { with: full_width_kana }
  end

end
