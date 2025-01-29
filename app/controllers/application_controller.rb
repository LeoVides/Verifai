class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # Allow homepage for unauthenticated users
  skip_before_action :authenticate_user!, if: -> { controller_name == "pages" && action_name == "home" }

  # Allow Devise controllers (sign-up, login) for unauthenticated users
  skip_before_action :authenticate_user!, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
