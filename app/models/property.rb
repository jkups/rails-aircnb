class Property < ApplicationRecord
  has_many :images
  has_many :reservations
  has_many :reviews, through: :reservations

  def address
  "#{street}, #{city}"
  end

  def full_address
  "#{street}, #{city}, #{state}, #{postcode}"
  end

  #Geocoding
  after_validation :geocode
  geocoded_by :full_address

  # define property search
  # def self.search(search)
  #   if search.present?
  #     property = Property.where(title: search)
  #   else
  #     Property.all
  #   end
  # end

  # search for property title including capital letter and lower case
  def self.search(search)
    if search
      where(["LOWER(title) LIKE ?", "%#{search.downcase}%"])
    else
      all
    end

  end



end
# end of class Property
