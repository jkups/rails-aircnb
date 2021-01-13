class Review < ApplicationRecord

<<<<<<< HEAD
  belongs_to :reservation, optional: true
  belongs_to :user, optional: true
  belongs_to :property, optional: true
=======
belongs_to :reservation, optional: true
belongs_to :user, optional: true
belongs_to :property, optional: true
>>>>>>> 64feda66e6268ca1d22fe4d84e99673b566ba863

end
