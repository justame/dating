class ApplicationController < ActionController::Base
  # protect_from_forgery
 	before_filter :allow_iframe_requests

	private
		def allow_iframe_requests
			# response.headers.delete('X-Frame-Options')
		# response.headers["X-Frame-Options"] = "ALLOW-FROM https://www.facebook.com"
		# binding.pry		
		end
end
