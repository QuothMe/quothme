require 'spec_helper'

module Quotes

def ensure_admin!
    unless current_admin.present? || current_user && current_user = @quote.user?
      sign_out current_user

      redirect_to root_path

      return false
    end
  end

    def render_not_found(status=:not_found)
      render text: "#{status.to_s.titleize}", status: status
    end
  
end

