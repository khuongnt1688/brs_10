class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  has_many :comments

  validates :content, presence: true, length: {maximum: 500}
  validates :rating, presence: true, inclusion: {in: 0..10}
end
