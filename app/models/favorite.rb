class Favorite < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  scope :user_favorite, -> user {where(user: user)}
end
