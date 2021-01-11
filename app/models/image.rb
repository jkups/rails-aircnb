class Image < ApplicationRecord
  belongs_to :property, optional: true
end
