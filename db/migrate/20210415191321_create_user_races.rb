class CreateUserRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :user_races do |t|
      t.integer :race_id
      t.integer :runner_id
      t.string :finish_time
      t.integer :rating
      t.text :review 

      t.timestamps
    end
  end
end
