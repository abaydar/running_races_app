class Comment < ApplicationRecord
    belongs_to :user_race
    belongs_to :commenter, :class_name => "User"
end
