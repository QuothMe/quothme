class Quote < ApplicationRecord
  belongs_to :user
  validates_presence_of :citation

  include PublicActivity::Model
  tracked

  PublicActivity.enabled = false


  tracked owner: Proc.new { |controller, model| controller.current_user}

  

  acts_as_taggable



  mount_uploader :image, ImageUploader

end
