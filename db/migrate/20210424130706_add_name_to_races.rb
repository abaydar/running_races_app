class AddNameToRaces < ActiveRecord::Migration[6.1]
  def change
    add_column :races, :name, :string
  end
end
