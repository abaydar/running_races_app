class RemoveRatingFromUserRaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_races, :rating
  end
end
