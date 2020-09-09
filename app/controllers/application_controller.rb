class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :basic_auth

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :katakana_last_name, :katakana_first_name, :birth])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |userid, password|
      userid == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
