class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.date :publish_date
      t.integer :number_of_pages
      t.string :image
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :books, :categories
  end
end
