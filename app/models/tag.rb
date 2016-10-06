class Tag < ApplicationRecord
  has_many :taggings
  has_many :quotes, through: :taggings
end
