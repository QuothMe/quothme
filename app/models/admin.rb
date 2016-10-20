class Admin < ApplicationRecord
  # before_invitation_created :send_admin_email
  # after_invitation_accepted :email_invited_by
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




end
