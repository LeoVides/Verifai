class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  # Allow homepage for unauthenticated users
  skip_before_action :authenticate_user!, if: -> { controller_name == "pages" && action_name == "home" }

  # Allow Devise controllers (sign-up, login) for unauthenticated users
  skip_before_action :authenticate_user!, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    results_path # Replace with the actual route helper for your fact-check page
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :profile_picture])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
