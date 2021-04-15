class Race < ApplicationRecord
    has_many :user_races
    has_many :reviews
    has_many :runners, through: :user_races, :foreign_key => :runner_id
    has_many :reviewers, through: :reviews, :foreign_key => :reviewer_id
end
