class QuotesController < ApplicationController

before_action :authenticate_user!
#before_action :ensure_admin!, only: [:edit, :update, :delete, :new]
before_action :load_activities, only: [:index, :show, :new, :edit]



  def index
    if params[:tag].present?
    @quotes = Quote.tagged_with(params[:tag])
  else 
    @quotes = Quote.all.order("created_at DESC")
  end
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
    return render_not_found if @quote.blank?
    unless @quote.user == current_user || current_admin.present?
      return render text: "Not Allowed", status: :forbidden
  end
  
end

def update
   @quote = Quote.find(params[:id]) 
   unless @quote.user == current_user || current_admin.present?
    return render text: "Not allowed", status: :forbidden
  end
    @quote.update_attributes(quote_params)
    redirect_to root_path
end

  def show 
    @quote = Quote.find(params[:id])

  end

    def destroy
    @quote = Quote.find_by_id(params[:id])
    return render_not_found if @quote.blank?
    unless @quote.user == current_user || current_admin.present?
    return render text: "Not Allowed", status: :forbidden
   end
    @quote.destroy
    redirect_to root_path
  end

  def like
    @quote = Quote.find(params[:id])
    if @quote.liked_by current_user
      respond_to do |format|
        format.html {redirect_to :back}
        format.js 
      end
    end
  end


  def unlike
    @quote = Quote.find(params[:id])
    if @quote.unliked_by current_user
      respond_to do |format|
        format.html {redirect_to :back}
        format.js 
      end
    end
  end
    

    

  

    private
    
  #    def ensure_admin!
  #   unless current_admin.present? || current_user && current_user = @quote.user?
  #     sign_out current_user

  #     redirect_to root_path

  #     return false
  #   end
  # end

    def quote_params
      params.require(:quote).permit(:citation, :image, :tag_list, :author_email, :author_first_name, :author_last_name, :author_username)
    end

    
    def load_activities 
       @activities = PublicActivity::Activity.order('created_at DESC')
    end

     def render_not_found(status=:not_found)
      render text: "#{status.to_s.titleize}", status: status
     end


end
