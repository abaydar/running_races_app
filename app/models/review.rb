class Review < ApplicationRecord
  belongs_to :races_reviewed, :class_name => "Race"
  belongs_to :reviewer, :class_name => "User"
end
