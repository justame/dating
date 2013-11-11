class UsersController < ApplicationController
before_filter do
	# @oauth = Koala::Facebook::OAuth.new('191719354235098', 'c85118212805cc76c3c4ef6b17c6eaf7')
	# @oauth.get_user_info_from_cookies(cookies)
	# session[:signed_request] = @oauth.parse_signed_request(params[:signed_request])
	# session[:facebook_cookies] = @oauth.get_user_info_from_cookies(cookies)
  end
before_filter :parse_facebook_cookies

def parse_facebook_cookies
  # @facebook_cookies ||= Koala::Facebook::OAuth.new('191719354235098', 'c85118212805cc76c3c4ef6b17c6eaf7').get_user_info_from_cookie(cookies)

  # If you've setup a configuration file as shown above then you can just do
  # @facebook_cookies ||= Koala::Facebook::OAuth.new.get_user_info_from_cookie(cookies)
end

def index
end

def welcome
	
	if session[:facebook_cookies] == nil
		# gon.redirect_url = @oauth.url_for_oauth_code(:permissions=>"email,read_stream");
		# binding.pry
	end
	# response.headers["X-Frame-Options"] = "Allow-From http://www.facebook.com"
	# response.headers.except! 'X-Frame-Options'
	# redirect_to @oauth.url_for_oauth_code(:permissions=>"my permissions")
	# @oauth = Koala::Facebook::OAuth.new('191719354235098', 'c85118212805cc76c3c4ef6b17c6eaf7', 'https://yaronna.no-ip.org:3000/users/')
	# binding.pry
	# # binding.pry

# signed_request =params[:signed_request]
# @oauth = Koala::Facebook::OAuth.new(191719354235098, "c85118212805cc76c3c4ef6b17c6eaf7") # example secret is 'secret', app ID doesn't matter
# @oauth.parse_signed_request(signed_request)
	#@oauth = Koala::Facebook::OAuth.new('191719354235098', 'c85118212805cc76c3c4ef6b17c6eaf7', 'https://apps.facebook.com/191719354235098/')
	# binding.pry
	render "index.html"
end
def login
	# binding.pry
	@oauth = Koala::Facebook::OAuth.new('191719354235098', 'c85118212805cc76c3c4ef6b17c6eaf7')
	@access_token = @oauth.get_app_access_token
	# @graph = Koala::Facebook::API.new(@access_token)
	binding.pry
end
def sandbox
# binding.pry
# @graph = Koala::Facebook::API.new('CAACEdEose0cBAHvjrCGrfQXeYeZAdMSKg7StSYdz5UbSAzgH3OrRC3itlU4ctmqk8ooCZCN64Q8zKFiIOCsqoU2R0JYxasDV0ROYsnMJvm4nG5fP8wTRHyKZCChidb46FSiw62ZBpGXq3yc85lHbkJ4SIkcRQJsbXhCyddNFAjpMJwZAtHGbb0AMIUUPyOJsZD')
# profile = @graph.get_object("me")
# binding.pry
end

end
