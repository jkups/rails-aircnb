class Review < ApplicationRecord

belongs_to: reservation, optional: true
belongs_to: users, through: reservation

end
