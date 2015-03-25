class Request < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :book_name, presence: true, length: {maximum: 140}
  validates :author, presence: true, length: {maximum: 70} 
  validates :state, presence: true 
end
