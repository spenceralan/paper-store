class AddReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews, id: :uuid do |t|
      t.string :content
      t.integer :rating

      t.uuid :user_id
      t.uuid :product_id

      t.timestamps
    end
  end
end
