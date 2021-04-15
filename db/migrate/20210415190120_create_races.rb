class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.string :distance
      t.string :location
      t.datetime :date
      t.string :age_group

      t.timestamps
    end
  end
end
