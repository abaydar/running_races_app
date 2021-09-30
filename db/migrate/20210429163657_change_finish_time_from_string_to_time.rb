class ChangeFinishTimeFromStringToTime < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_races, :finish_time
  end
end
