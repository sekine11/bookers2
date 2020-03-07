class User < ApplicationRecord
  validates :introduction, length: { maximum: 50 }, on: :update
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  attachment :profile_image
  validates :name, length: { in: 2..20 }
end