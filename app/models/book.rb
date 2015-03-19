class Book < ActiveRecord::Base
  belongs_to :category
  has_many :reviews
  
  validates :title, presence: true, length: {maximum: 100}
  validates :publish_date, presence: true
  validates :author, presence: true, length: {maximum: 150}
  validates :number_of_pages, presence: true

  def self.search(search, filter)
    if search
      if filter = 1
        where('title LIKE ?', "%#{search}%")
      elsif filter = 2
        where('author LIKE ?', "%#{search}%")
      end 
    else
      all
    end
  end
end