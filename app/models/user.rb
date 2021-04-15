class User < ApplicationRecord
  has_secure_password
  has_many :user_races
  has_many :reviews 
  has_many :races_run, through: :user_races, :foreign_key => :races_run_id
  has_many :races_reviewed, through: :reviews, :foreign_key => :races_reviewed

end
