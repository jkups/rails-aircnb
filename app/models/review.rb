class Review < ApplicationRecord

belongs_to :reservation, optional: true
belongs_to :user, optional: true

end
