class Property < ApplicationRecord
  has_many :images
  has_many :reservations

  def address
  "#{street}, #{city}"
  end

  def full_address
  "#{street}, #{city}, #{state}, #{postcode}"
  end

  #Geocoding
  after_validation :geocode
  geocoded_by :full_address
end
