class User < ApplicationRecord
  enum role: [:regular, :editor, :admin ]
  enum status: [:pending, :approved]

  has_many :posts , dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
end
