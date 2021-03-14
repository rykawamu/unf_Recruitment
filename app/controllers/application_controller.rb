class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def move_to_signed_in
    unless logged_in?
      redirect_to login_path
    end
  end
end
