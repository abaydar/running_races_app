class User < ApplicationRecord
  has_secure_password
  has_many :user_races
  has_many :races, through: :user_races
  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6 }, if: :password_digest_changed?

  
  scope :most_races_run, -> {joins(:user_races).group("user_races.user_id").order("count(user_races.user_id) desc").limit(1)}



end
