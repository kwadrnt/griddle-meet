class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!



  def configure_permitted_parameters
      added_attrs = [:name, :email, :password, :password_confirmation, :remember_me,
        :address, :role, :location, :menu, :hours]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

end
