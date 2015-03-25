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
  has_many :favorites, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 100}        
  validates :avatar, presence: false, length: {maximum: 300}
  validates :role, presence: true, length: {maximum: 50}

  def is_admin?
    role == 'admin'
  end

  scope :search_by, ->name {where('name LIKE ?', "%#{name}%")}

  def is_user? user
    self == user
  end

  def favorite? book
    !self.favorites.find_by(book: book).nil?
  end
  
  def follow other_user
    active_relationships.create followed_id: other_user.id
  end

  def unfollow other_user
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following? other_user
    following.include? other_user
  end

  def to_param
    [id, name.parameterize].join("-")
  end
end
