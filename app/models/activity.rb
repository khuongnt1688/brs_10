class Activity < ActiveRecord::Base
  belongs_to :user
  validates :target_id, presence: true
  validates :action_type, presence: true
  has_many :likes   
end
