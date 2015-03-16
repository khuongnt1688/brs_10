class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :book_name
      t.string :author
      t.references :user, index: true
      t.string :book_url
      t.string :state

      t.timestamps null: false
    end
    add_foreign_key :requests, :users
  end
end
