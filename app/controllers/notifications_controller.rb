class NotificationsController < ApplicationController

  def link_through
  	@notification = Notification.find(params[:id])
  	@notification.update read: true
  	redirect_to quote_path @notification.quote
  end

end
