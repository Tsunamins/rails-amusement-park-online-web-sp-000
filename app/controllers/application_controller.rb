class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  #before_action :redirect_if_not_logged_in

  helper_method :current_user, :logged_in?


  private

  def current_user
    
    User.find_by(id:session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end
end
