class QuotesController < ApplicationController

before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]

  def index
    @quotes = Quote.all
  end

  def show
    @quote = Quote.find(params[:id])
  end

  def create
    @quote = current_user.quotes.create(quote_params)
    redirect_to root_path
  end

   def new
    @quote = Quote.new
   end

  def edit
    @quote = Quote.find(params[:id])
    if @quote.user != current_user
      return render text: "Not Allowed", status: :forbidden
  end
end

def update
   @quote = Quote.find(params[:id]) 
   if @quote.user != current_user
    return render text: "Not allowed", status: :forbidden
  end
    @quote.update_attributes(quote_params)
    redirect_to root_path
end

  def show 
    @quote = Quote.find(params[:id])
  end

    def destroy
    @quote = Quote.find(params[:id])
    if @quote.user != current_user
    return render text: "Not Allowed", status: :forbidden
   end
    @quote.destroy
    redirect_to root_path
  end

  

    private
  
    def quote_params
      params.require(:quote).permit(:citation, :image)
    end




end
