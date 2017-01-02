class Quote < ApplicationRecord
  acts_as_votable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates_presence_of :citation

  include PublicActivity::Model
  tracked

  PublicActivity.enabled = false


  tracked owner: Proc.new { |controller, model| controller.current_user}

  

  acts_as_taggable




  mount_uploader :image, ImageUploader

end
