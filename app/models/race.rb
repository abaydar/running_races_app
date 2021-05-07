class Race < ApplicationRecord
    has_many :user_races
    has_many :users, through: :user_races
    belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"

    accepts_nested_attributes_for :user_races 

    validates :name, :distance, :location, :date, presence: true 
    validates :name, uniqueness: { case_sensitive: false }
    validate :date_is_in_past 

    def date_is_in_past
      if date > Date.today
        errors.add(:date, "must be in the past")
      end
    end

    def self.search(query)
        if query
          self.where('name LIKE ?', "%#{query}%")
        else
          self.all
        end
    end

  scope :most_popular_race, -> {joins(:user_races).group("user_races.user_id").order("count(user_races.user_id) desc").limit(1)}
 

end

