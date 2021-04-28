class UserRace < ApplicationRecord
    belongs_to :race
    belongs_to :user

    # validates :finish_time, presence: true
end
