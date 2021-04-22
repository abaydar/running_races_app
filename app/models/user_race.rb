class UserRace < ApplicationRecord
    belongs_to :race
    belongs_to :runner, :class_name => "User"
    has_many :comments 
    has_many :commenters, through: :comments, :foreign_key => :commenter_id
end
