class BookState < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  scope :read_history, -> user {where(user: user, state: ["read", "reading"])}
end
