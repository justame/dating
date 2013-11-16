class ApplicationController < ActionController::Base
  before_filter do 
		session[:app_oauth] ||= Koala::Facebook::OAuth.new(DatingApp.APP_ID, DatingApp.APP_SECRET)
  end

end
