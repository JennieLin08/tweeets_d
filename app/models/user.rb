class User < ApplicationRecord
  enum role: [:admin, :regular, :editor ]
  enum status: [:approved, :pending]

  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
