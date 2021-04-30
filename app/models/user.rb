class User < ApplicationRecord
  has_secure_password
  has_many :user_races
  has_many :races, through: :user_races
  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :password, length: {minimum: 6}

  # def self.last_race_run
  #   joins(:user_races).order(created_at: :desc).limit(1)
  # end


  # scope :last_race_run, -> {joins(:user_races).order(created_at: :desc).limit(1)}

end
