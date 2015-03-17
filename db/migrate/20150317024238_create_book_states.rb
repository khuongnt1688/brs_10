class CreateBookStates < ActiveRecord::Migration
  def change
    create_table :book_states do |t|
      t.string :state
      t.string :image
      t.references :book, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :book_states, :books
    add_foreign_key :book_states, :users
  end
end
