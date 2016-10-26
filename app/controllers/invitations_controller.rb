class InvitationsController < Devise::InvitationsController
  before_filter :ensure_admin!

  def update
  if Admin.accept_invitation!(user_params)
    sign_in(params[:admin])
    redirect_to root_path, notice: t('invitation.accepted')
  else
    redirect_to root_path, error: t('invitation.not_accepted')
  end
end



end
