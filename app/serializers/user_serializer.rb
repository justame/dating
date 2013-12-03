class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :fb_id, :liked

  def liked
  	object.liked_by?(current_user)
  end
end
