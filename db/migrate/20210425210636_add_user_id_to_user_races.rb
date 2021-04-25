class AddUserIdToUserRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :user_races, :user_id, :integer
  end
end
