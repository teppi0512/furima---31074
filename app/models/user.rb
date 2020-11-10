class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  NAME_REGEX_1 = /\A[ぁ-んァ-ン一-龥]+\z/
  NAME_REGEX_2 = /\A[ァ-ヶー－]+\z/
  NAME_REGEX_3 = /\A[a-zA-Z0-9]+\z/

  with_options presence: true do
    validates :nickname
    validates :last_name, format:{ with:NAME_REGEX, message: "is invalid. Input full-width characters."}
    validates :first_name, format:{ with:NAME_REGEX, message: "is invalid. Input full-width characters."}
    validates :last_name_kana, format:{ with:NAME_REGEX_2, message: "is invalid. Input full-width characters."}
    validates :first_name_kana, format:{ with:NAME_REGEX_2, message: "is invalid. Input full-width characters."}
    validates :birthdate
    validates :password, format:{ with:NAME_REGEX_3, message: "is invalid. Input full-width characters."}
  end
end
