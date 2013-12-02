class UsersController < ApplicationController
	respond_to :json, :html
	
	def index
		respond_with User.all
	end

	def login
		oauth = Koala::Facebook::OAuth.new(DatingApp.APP_ID, DatingApp.APP_SECRET,"https://www.facebook.com/dialog/oauth?")
		signed_request = oauth.parse_signed_request(params["signed_request"])
		fb_access_token = signed_request["oauth_token"]
		user_graph = Koala::Facebook::API.new(fb_access_token)
		user = User.find_by_fb_id(signed_request["user_id"])
		
		if(user.nil?)
			fb_user = user_graph.get_object("me")
			user = register_user(fb_user)
		end

		user.fb_access_token = fb_access_token
		user.save!

		cookies["user_id"] = user.id
		cookies["access_token"] = user.access_token

	end

	def register_user(fb_user)
		User.create({
			fb_id: fb_user["id"],
			first_name: fb_user["first_name"],
			last_name: fb_user["last_name"],
			acess_token: SecureRandom.urlsafe_base64(16)
			})
	end


end
