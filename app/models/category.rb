class Category < ActiveRecord::Base
  has_many :books
  
  validates :content, presence: true, length: {maximum: 150}	
end
