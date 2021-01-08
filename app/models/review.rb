class Review < ApplicationRecord

belongs_to :reservation, optional: true
belongs_to :users, optional: true

end
