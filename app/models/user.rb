class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :password_digest, confirmation: true

  has_many :reviews
  has_and_belongs_to_many :reservations

end
