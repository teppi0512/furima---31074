class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :firstn_name_kana, presence: true
  validates :birthdate, presence: true
 
  with_options presence: true do
    validates :nickname
    validates :last_name, format:{ with:/\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
    validates :first_name, format:{ with:/\A[ぁ-んァ-ン一-龥]+\z/, message: "is invalid. Input full-width characters."}
    validates :last_name_kana, format:{ with:/\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
    validates :first_name_kana, format:{ with:/\A[ァ-ヶー－]+\z/, message: "is invalid. Input full-width characters."}
    validates :birthdate
    validates :password, format:{ with:/\A[a-zA-Z0-9]+\z/, message: "is invalid. Input full-width characters."}
  end

  has_many :prototypes

end
