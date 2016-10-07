class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @users = User.includes(:quotes)
  end
end
