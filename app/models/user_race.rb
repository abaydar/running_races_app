class UserRace < ApplicationRecord
    belongs_to :race
    belongs_to :user

    validate :finish_time_is_after

    def finish_time_is_after
        if start_time.to_f > finish_time.to_f
            errors.add(:finish_time, "cannot be before start time")
        end
    end

    def finish_time_calculated(start_time, finish_time)
        t = finish_time - start_time
        Time.at(t).utc.strftime("%H:%M:%S")
    end

    # scope :top_three_times, -> {order("finish_time_calculated(:start_time, :finish_time) desc").limit(3)}
end
