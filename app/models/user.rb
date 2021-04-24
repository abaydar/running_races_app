class User < ApplicationRecord
  has_secure_password
  has_many :user_races
  has_many :races, through: :user_races
  validates :name, :username, :age, :password, presence: true
end
