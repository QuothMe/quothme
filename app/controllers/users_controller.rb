class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @users = User.includes(:quotes, :tags)
  end

  def following
  	@user = User.find(params[:id])
  	@users = @user.following
  end

  def followers
  	@user = User.find(params[:id])
  	@users = @user.followers
  end

  

  private


end
