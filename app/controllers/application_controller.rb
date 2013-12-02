class ApplicationController < ActionController::Base
  before_filter :current_user
	
  def current_user
  	@current_user ||= User.where(id: params["user_id"], access_token: params["access_token"]).first
  end

end
