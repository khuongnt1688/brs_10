class Category < ActiveRecord::Base
  validates :content, presence: true, length: {maximum: 150}
  has_many :books
end
