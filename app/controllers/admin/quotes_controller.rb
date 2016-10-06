class Admin::QuotesController < ApplicationController
  before_filter :ensure_admin!


  def new
    @quote = Quote.new
  end 

  def create
    @quote = current_admin.quotes.create(quote_params)
    redirect_to root_path
  end

  private

  def ensure_admin!
    unless current_user.admin?
      sign_out current_user

      redirect_to root_path

      return false
    end
  end

  def quote_params
     params.require(:quote).permit(:citation, :image, :tag_list, :author_email, :author_first_name, :author_last_name, :author_username)
  end

end
