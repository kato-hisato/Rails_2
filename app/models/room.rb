class Room < ApplicationRecord
    
    validates :name, presence: true
    validates :introduction, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
                                      format: { with: /\A[0-9]+\z/ }
    validates :address, presence: true

    mount_uploader :image, ImageUploader
    belongs_to :user
    has_many :reservations
end
