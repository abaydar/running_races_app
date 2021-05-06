class User < ApplicationRecord
  has_secure_password
  has_many :user_races
  has_many :races, through: :user_races
  validates :name, :username, :age, presence: true
  validates :username, uniqueness: true
  validates :age, numericality: { only_integer: true }
  validates :password, length: { minimum: 6 }, if: :password_digest_changed?

  
  scope :most_races_run, -> {joins(:user_races).group("user_races.user_id").order("count(user_races.user_id) desc").limit(1)}

  # scope :avg_user_age, -> {average('age')}
  # scope :recent_users, ->{order('created_at desc').includes(:user_races).limit(10)}

end


