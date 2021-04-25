class RemoveRunnerIdFromUserRaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_races, :runner_id
  end
end
