class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_activities, only: [:index, :show, :new, :edit]

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

  def load_activities
        @activities = PublicActivity::Activity.order('created_at DESC').where(owner_id: current_user.following_ids)
  end

end
