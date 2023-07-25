class User < ApplicationRecord
  enum :role, [:normal_user, :admin]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :comments
  has_many :publications

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
