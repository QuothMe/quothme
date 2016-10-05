class Quote < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader

  extend FriendlyId

  friendly_id :citation

   def should_generate_new_friendly_id?
    new_record?
  end

end
