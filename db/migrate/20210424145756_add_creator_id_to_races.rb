class AddCreatorIdToRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :races, :creator_id, :integer
  end
end
