class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :likes 
  
  validates :target_id, presence: true
  validates :action_type, presence: true
end
