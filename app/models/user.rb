class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password #this line replaces line 6
  # validates :password_digest, confirmation: true

  has_many :reviews
  has_and_belongs_to_many :reservations

  # define user search
  def self.search(search)
    if search.present?
      user = User.where(name: search)

    else
      User.all
    end
  end

end
