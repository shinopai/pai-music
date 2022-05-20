class User < ApplicationRecord
  # validation
  validates :name,
            presence: true,
            length: { maximum: 30 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # relation
  has_many :artists
end
