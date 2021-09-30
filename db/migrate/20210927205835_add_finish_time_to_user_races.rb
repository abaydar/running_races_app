class AddFinishTimeToUserRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :user_races, :finish_time, :time
  end
end
