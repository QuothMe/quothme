class Quote < ApplicationRecord
  acts_as_votable

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates :citation, :tag_list, presence: true

  mount_uploader :image, ImageUploader

  include PublicActivity::Model
  tracked


  PublicActivity.enabled = false


  tracked owner: Proc.new { |controller, model| controller.current_user}

  

  acts_as_taggable




  

end
