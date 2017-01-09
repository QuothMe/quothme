class AdminsController < ApplicationController
  before_action :ensure_admin!, only:[:new, :create, :edit, :update, :delete]

  def index
    @admins = Admin.all
    @admin = Admin.new
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
    unless current_admin.present? || current_user.admin?

      redirect_to root_path

      return false
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation, :username, :first_name, :profile_picture, :last_name)
  end  

end
