class Category < ActiveRecord::Base
  has_many :books
  
  mount_uploader :image, PictureUploader

  validates :content, presence: true, length: {maximum: 150}	
  validate  :image_size

  scope :search_by , ->content {where('content LIKE ?', "%#{content}%")}

  def self.search(search)
    if search
      where('content LIKE ?', "%#{search}%")
    else
      all
    end
  end

  private
  def image_size
    errors.add :image, "should be less than 5MB" if image.size > 5.megabytes
  end
end