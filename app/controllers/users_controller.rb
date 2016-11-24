class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.friendly.find(params[:id])
    @users = User.includes(:quotes, :tags)
  end

  def following
  	@user = User.friendly.find(params[:id])
  	@users = @user.following
    render 'show_follow'
  end

  def followers
  	@user = User.friendly.find(params[:id])
  	@users = @user.followers
    render 'show_follow'

  end

  

  private


end
