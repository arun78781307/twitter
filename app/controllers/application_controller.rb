class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_out_path
    if user_signed_in?
      destroy_user_session_url

    end

    redirect_to 'Home'
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
