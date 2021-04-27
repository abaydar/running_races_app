class AddFinishTimeAndReviewToRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :races, :finish_time, :string
    add_column :races, :review, :text
  end
end
