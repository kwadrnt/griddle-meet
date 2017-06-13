class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  	render "../views/layouts/application.html.erb"
  end

  def after_sign_in_path_for(resource_or_scope)
    user_trucks_path(@user)
  end

  def after_sign_up_path_for(resource_or_scope)
    current_user
  end

  def after_sign_out_path_for(resource_or_scope)
   new_user_registration_path
  end

  def configure_permitted_parameters
      added_attrs = [:name, :email, :password, :password_confirmation, :remember_me,
        :address, :role, :location, :menu, :hours]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    end

end
