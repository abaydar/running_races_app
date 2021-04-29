class AddStartTimeToUserRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :user_races, :start_time, :time
  end
end
