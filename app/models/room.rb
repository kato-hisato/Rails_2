class Room < ApplicationRecord
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 } #0より大きい整数
    validates :address, presence: true

    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :reservations
end
