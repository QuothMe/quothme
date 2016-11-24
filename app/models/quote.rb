class Quote < ApplicationRecord
  belongs_to :user
  validates_presence_of :citation

  include PublicActivity::Model
  tracked
  

  acts_as_taggable



  mount_uploader :image, ImageUploader

end
