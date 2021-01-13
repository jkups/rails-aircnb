class Review < ApplicationRecord

belongs_to :reservation, optional: true
belongs_to :user, optional: true
belongs_to :property, optional: true

end
