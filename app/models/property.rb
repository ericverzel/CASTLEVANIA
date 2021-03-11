class Property < ApplicationRecord

  #geocoding
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :address, uniqueness: true
  validates :price, presence: true
end
