class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :races_reviewed_id
      t.integer :reviewer_id
      t.integer :rating
      t.text :content

      t.timestamps
    end
  end
end
