class UserRace < ApplicationRecord
    belongs_to :races_run, :class_name => "Race"
    belongs_to :runner, :class_name => "User"
end
