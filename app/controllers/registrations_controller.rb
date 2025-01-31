class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  layout "application"  # Ensures Devise pages use the main layout

  def remove_profile_picture
    if current_user.profile_picture.attached?
      current_user.profile_picture.purge
      flash[:notice] = "Profile picture removed successfully."
    else
      flash[:alert] = "No profile picture to remove."
    end
    redirect_to root_path
  end

  protected

end
