class ApplicationController < ActionController::Base
  before_filter do 
		session[:app_oauth] ||= Koala::Facebook::OAuth.new(DatingApp.APP_ID, DatingApp.APP_SECRET)
  end

	
  def current_user
  	fb_user = session["fb_user"]
  	User.find_by_fb_id(fb_user["id"])
  end

end
