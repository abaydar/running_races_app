class Race < ApplicationRecord
    has_many :user_races
    has_many :runners, through: :user_races, :foreign_key => :runner_id
end
