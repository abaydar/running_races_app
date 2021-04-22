class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :commenter_id
      t.integer :user_race_id
      t.text :content

      t.timestamps
    end
  end
end
