class UserRace < ApplicationRecord
    belongs_to :race
    belongs_to :runner, :class_name => "User"
end
