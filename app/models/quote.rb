class Quote < ApplicationRecord
  belongs_to :user
  validates_presence_of :citation
  

  acts_as_taggable



  mount_uploader :image, ImageUploader

end
