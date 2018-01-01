class Restaurant < ApplicationRecord

  validates_presence_of :name, :category_id
  
  mount_uploader :image, PhotoUploader
  
  belongs_to :category, optional: true

  has_many :comments

end
