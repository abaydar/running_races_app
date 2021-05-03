class RemoveAgeGroupFromRaces < ActiveRecord::Migration[6.1]
  def change
    remove_column :races, :age_group
  end
end
