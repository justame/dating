class UserLikesController < ApplicationController
	respond_to :json
	
	def create
		current_user.user_likes.create({
			target_user_id: params["user_id"]
		})

		render json: :empty
	end

end
