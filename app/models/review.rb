class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  validates :content, presence: true, length: {maximum: 500}
  has_many :comments
end
