class Race < ApplicationRecord
    has_many :user_races
    has_many :runners, through: :user_races, :foreign_key => :runner_id
    belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"
    validates :name, :distance, :location, :date, presence: true 
    validates :name, uniqueness: { case_sensitive: false }
end
