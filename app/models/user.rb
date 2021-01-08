class User < ApplicationRecord

  has_many: reviews, through: reservation
  has_many: reservations, optional: true

end
