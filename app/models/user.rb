class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :password, format: {with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)}

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/} do
    validates :family_name_kana
    validates :first_name_kana
  end
    validates :birthday, presence:true
  

end
