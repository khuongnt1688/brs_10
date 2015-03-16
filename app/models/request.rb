class Request < ActiveRecord::Base
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :user, presence: true
  validates :book_name, presence: true, length: {maximum: 140}
  validates :author, presence: true, length: {maximum: 70}
end
