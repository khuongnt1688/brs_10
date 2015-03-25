class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :requests, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :book_states, dependent: :destroy

  validates :name, length: {maximum: 100}        
  validates :avatar, presence: false, length: {maximum: 300}
  validates :role, presence: true, length: {maximum: 50}

  def is_admin?
    role == 'admin'
  end

  scope :search_by, ->name {where('name LIKE ?', "%#{name}%")}

  def is_user? user
    self == user
  end
  
end
