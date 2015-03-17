class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :content
      t.integer :rating
      t.references :book, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :books
    add_foreign_key :reviews, :users
  end
end
