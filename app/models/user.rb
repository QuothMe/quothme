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
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  
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

    def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end


end
