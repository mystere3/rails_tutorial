class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  protected

  def configure_devise_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end

  private
  # def current_writer
  #   # this uses session[:user id] unless its nil - less server calls
  #   @current_writer ||= Writer.find_by_id(session[:writer_id]) if session[:writer_id]
    
  # end

  # def authorize
  #   redirect_to :root, alert: 'You must be logged in to view this page' if current_writer.nil?
  # end

  # this allows the private method above to be used in views or elsewhere
  # helper_method :current_writer
  
end
