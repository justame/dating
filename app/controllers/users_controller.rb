class UsersController < ApplicationController
	before_filter :get_user_data, except:[:login]
	def get_user_data
		
		@user_access_token = session[:signed_request]["oauth_token"]
		@user_graph = Koala::Facebook::API.new(@user_access_token)
	end

	def index
		@profile_images = []

		albums = @user_graph.get_connection("me","albums",fields: "id,type")
		profile_album = albums.first
		if(profile_album.nil? == false)
			@profile_images = @user_graph.get_connection(profile_album["id"],"photos",fields: "source, name")
		end
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
		@oauth = Koala::Facebook::OAuth.new(DatingApp.APP_ID, DatingApp.APP_SECRET,"https://www.facebook.com/dialog/oauth?")
		session[:signed_request] = session[:app_oauth].parse_signed_request(params["signed_request"])
		# binding.pry
		# gon.redirect_url = @oauth.url_for_oauth_code(:permissions => "user_about_me,user_photos")
		# session[:user_access_token] = session[:signed_request]["oauth_token"]
		# session[:user_graph] = Koala::Facebook::API.new(session[:user_access_token])
		# session[:user_info]= session[:user_graph].get_object("me")
		
		#friends
		# session[:user_info] = @oauth.get_user_info_from_cookies(cookies)
		# @oauth.parse_signed_request(signed_request)
	end


end
