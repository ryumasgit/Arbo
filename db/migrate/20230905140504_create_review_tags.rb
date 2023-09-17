class CreateReviewTags < ActiveRecord::Migration[6.1]
  def change
    create_table :review_tags do |t|
      t.integer :review_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
  end
end
