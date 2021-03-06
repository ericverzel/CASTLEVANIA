class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :date_from, presence: true
  validates :date_to, presence: true
end
