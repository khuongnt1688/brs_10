class Read < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  validates :status, presence: true
  validates :farvorite, presence: true
  validates :rating, presence: true 
end
