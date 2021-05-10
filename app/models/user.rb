class User < ApplicationRecord
  has_secure_password
  has_many :user_races
  has_many :races, through: :user_races
  validates :name, :username, presence: true
  validates :username, uniqueness: true
  validates :age, allow_blank: true, numericality: { only_integer: true }
  validates :password, length: { minimum: 6 }, if: :password_digest_changed?
  validates :password, confirmation: { case_sensitive: true }

  scope :most_races_run, -> {joins(:user_races).group("user_races.user_id").order("count(user_races.user_id) desc").limit(3)}

  def self.search(query)
    if query
      self.where('name LIKE ?', "%#{query}%")
    else
      self.all
    end
  end

  def self.omniauth(response)
    user = User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|  
      u.username = response[:info][:email]
      u.name = response[:info][:name]
      u.password = SecureRandom.hex(15)
    end
  end
  
  # scope :oldest_user, -> {order('age desc').limit(1)}
  # scope :avg_user_age, -> {average('age')}
  # scope :recent_users, ->{order('created_at desc').includes(:user_races).limit(10)}

end


