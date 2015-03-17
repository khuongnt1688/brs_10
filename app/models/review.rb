class Review < ActiveRecord::Base
  belongs_to :book
  belongs_to :user
  has_many :comments

  validates :content, presence: true, length: {maximum: 500}
end
