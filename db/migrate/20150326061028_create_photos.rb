class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :photos, :books
  end
end