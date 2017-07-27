class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment, limit: 128
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true

      t.timestamps
    end
  end
end
