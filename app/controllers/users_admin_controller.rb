class UsersAdminController < ApplicationController


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
     if @user.save
        flash[:notice] = "User created"
        AdminMailer.email_admin(self).deliver
      redirect_to root_path
    else
      render :new
    end
  end



  private 

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :profile_picture, :last_name, :type, :username)
  end  

end