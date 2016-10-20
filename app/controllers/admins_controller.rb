class AdminsController < ApplicationController
  before_filter :ensure_admin!

  def index
    @admins = Admin.all
  end

  def show
  @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

 def create
    @admin = Admin.new(admin_params)
      Admin.invite!(:email => params[:admin][:email])
      flash[:notice] = "Admin Invite sent"
      redirect_to root_path
 end

  def ensure_admin!
    unless current_user.admin?
      sign_out current_user

      redirect_to root_path

      return false
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation, :first_name, :profile_picture, :last_name)
  end  

end
