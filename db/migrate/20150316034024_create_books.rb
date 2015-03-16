class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.date :publish_date
      t.string :author
      t.integer :number_of_pages
      t.references :category, index: true
      t.string :image

      t.timestamps null: false
    end
    add_foreign_key :books, :categories
  end
end
