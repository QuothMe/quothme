class PagesController < ApplicationController
  def show
    render template: "pages/#{params[:page]}"
  end

  def home
    @disable_nav = false
  end

end
