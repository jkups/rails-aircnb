class Reservation < ApplicationRecord
  validates :booking_code, presence: true, uniqueness: true

  has_many :reviews
  has_and_belongs_to_many :users
  belongs_to :property, optional: true

end
