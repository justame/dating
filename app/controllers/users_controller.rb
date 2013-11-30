class UsersController < ApplicationController
	before_filter :get_user_data, except:[:login]
	def get_user_data
		
		@user_access_token = session[:signed_request]["oauth_token"]
		@user_graph = Koala::Facebook::API.new(@user_access_token)

	end

	def index
		# respond_with User.all
		# @user = current_user
		# @profile_images = []

		# albums = @user_graph.get_connection("me","albums",fields: "id,type")
		# profile_album = albums.first
		# if(profile_album.nil? == false)
		# 	@profile_images = @user_graph.get_connection(profile_album["id"],"photos",fields: "source, name")
		# end
	end

	# def welcome
	# 	render "index.html"
	# end

	def login
		@oauth = Koala::Facebook::OAuth.new(DatingApp.APP_ID, DatingApp.APP_SECRET,"https://www.facebook.com/dialog/oauth?")
		session[:signed_request] = session[:app_oauth].parse_signed_request(params["signed_request"])
		user_access_token = session[:signed_request]["oauth_token"]
		user_graph = Koala::Facebook::API.new(user_access_token)
		fb_user = user_graph.get_object("me")
		session["fb_user"] = fb_user
		if (User.find_by_fb_id(fb_user["id"]).nil?)
			register(fb_user)
		end

	end

	def register(fb_user)
		User.create({
			fb_id: fb_user["id"],
			first_name: fb_user["first_name"],
			last_name: fb_user["last_name"]
			})
	end


end
