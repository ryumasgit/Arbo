class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :member_id, null: false
      t.integer :exhibition_id, null: false
      t.string :body, null: false

      t.timestamps
    end
  end
end
