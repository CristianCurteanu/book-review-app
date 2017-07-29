class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :url
      t.belongs_to :book, index: true

      t.timestamps
    end
  end
end
