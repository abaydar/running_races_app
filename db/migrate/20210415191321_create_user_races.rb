class CreateUserRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :user_races do |t|
      t.integer :races_run_id
      t.integer :runner_id
      t.string :finish_time

      t.timestamps
    end
  end
end
