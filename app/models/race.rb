class Race < ApplicationRecord
    has_many :user_races
    has_many :users, through: :user_races
    belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"

    # accepts_nested_attributes_for :user_races 

    validates :name, :distance, :location, :date, presence: true 
    validates :name, uniqueness: { case_sensitive: false }

    def user_races_attributes=(user_races_attributes)
        user = User.find_by_id(params[:user_id])
    end

end

