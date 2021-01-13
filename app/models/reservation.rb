class Reservation < ApplicationRecord
  validates :booking_code, presence: true, uniqueness: true

  has_many :reviews
  has_and_belongs_to_many :users
  belongs_to :property, optional: true
  has_many :images, through: :property

  def get_total_due
    price_per_night = self.property.listing_price
    service_fee = self.property.service_fee
    cleaning_fee = self.property.cleaning_fee
    guests_count = self.guests_count
    total_nights = (self.to_date - self.from_date).to_i

    total_due = total_nights * price_per_night + service_fee + cleaning_fee
  end

  def pay_with_braintree nonce
    gateway = Braintree::Gateway.new(
      :environment => :sandbox,
      :merchant_id => ENV["BRAINTREE_MERCHANT_ID"],
      :public_key => ENV["BRAINTREE_PUBLIC_KEY"],
      :private_key => ENV["BRAINTREE_PRIVATE_KEY"],
    )

    result = gateway.transaction.sale(
      :amount => self.total_due,
      :payment_method_nonce => nonce,
      :options => {
        :submit_for_settlement => true
      }
    )

    result
  end
end
