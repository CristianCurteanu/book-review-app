class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, unique: true
      t.text :description, limit: 256
      t.string :author

      t.timestamps
    end
  end
end
