class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
 
  validates :profile, length: { maximum: 250 }
  mount_uploader :image, ImageUploader

  has_many :rooms
  has_many :reservations
end
