class AddFinishTimeAndReviewToUserRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :user_races, :finish_time, :string
    add_column :user_races, :review, :text
  end
end
