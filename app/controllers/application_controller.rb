class ApplicationController < ActionController::Base
  before_action :configure_devise_parameters, if: :devise_controller?

  # ...

  private

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_in_path_for(_resource_or_scope)
    categories_path
  end
end
