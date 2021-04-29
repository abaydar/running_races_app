class ChangeFinishTimeFromStringToTime < ActiveRecord::Migration[6.1]
  def change
    change_column :user_races, :finish_time, :time
  end
end
