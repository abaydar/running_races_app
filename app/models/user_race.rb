class UserRace < ApplicationRecord
    belongs_to :race
    belongs_to :user

    validate :finish_time_is_after

    def finish_time_is_after
        if start_time.to_f > finish_time.to_f
            errors.add(:finish_time, "cannot be before start time")
        end
    end

end
