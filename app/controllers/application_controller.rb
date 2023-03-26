class ApplicationController < ActionController::Base
  def current_user
    #todo: create session logic
    @current_user ||= User.first #return default user
    @current_user
  end
end
