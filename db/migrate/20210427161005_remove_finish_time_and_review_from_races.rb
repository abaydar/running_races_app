class RemoveFinishTimeAndReviewFromRaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :races, :review
    remove_column :races, :finish_time
  end
end
