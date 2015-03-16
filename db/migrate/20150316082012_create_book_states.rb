class CreateBookStates < ActiveRecord::Migration
  def change
    create_table :book_states do |t|
      t.string :state
      t.string :image
      t.references :user, index: true
      t.references :book, index: true

      t.timestamps null: false
    end
    add_foreign_key :book_states, :users
    add_foreign_key :book_states, :books
  end
end
