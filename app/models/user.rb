class User < ApplicationRecord
  has_secure_password
  has_many :user_races
  has_many :races, through: :user_races
  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum: 6}

end
