class UsersController < ApplicationController

def index

end

def welcome
	# @oauth = Koala::Facebook::OAuth.new('191719354235098', 'c85118212805cc76c3c4ef6b17c6eaf7', 'http://yaronna.no-ip.org:3000/users/')
	# response.headers["X-Frame-Options"] = "Allow-From http://www.facebook.com"
	# response.headers.except! 'X-Frame-Options'
	# redirect_to @oauth.url_for_oauth_code(:permissions=>"my permissions")
	@oauth = Koala::Facebook::OAuth.new('191719354235098', 'c85118212805cc76c3c4ef6b17c6eaf7', 'http://yaronna.no-ip.org:3000/users/')
	# binding.pry

	render "index.html"
end

def sandbox
@graph = Koala::Facebook::API.new('CAACEdEose0cBAHvjrCGrfQXeYeZAdMSKg7StSYdz5UbSAzgH3OrRC3itlU4ctmqk8ooCZCN64Q8zKFiIOCsqoU2R0JYxasDV0ROYsnMJvm4nG5fP8wTRHyKZCChidb46FSiw62ZBpGXq3yc85lHbkJ4SIkcRQJsbXhCyddNFAjpMJwZAtHGbb0AMIUUPyOJsZD')
profile = @graph.get_object("me")
# binding.pry
end

end
