class Api::QuotesController < ApplicationController

  def index 
    @quotes = Quote.all
    if @name  = params[:author_first_name]
      @quotes = @quotes.where(author_first_name: @name)
    end
    render json: @quotes, status: 200
  end

end
