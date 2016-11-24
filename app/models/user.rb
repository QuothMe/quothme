class User < ApplicationRecord
  has_many :quotes, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship",
  								  foreign_key: "follower_id",
  								  dependent: :destroy	

  has_many :passive_relationships, class_name: "Relationship",
  								  foreign_key: "followed_id",
  								  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  mount_uploader :profile_picture, ProfilePictureUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  extend FriendlyId

  friendly_id :username


  def follow(other_user)
  	active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
  	active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
  	following.include?(other_user)
  end


end
