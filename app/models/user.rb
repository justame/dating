# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  fb_id           :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  age             :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  fb_access_token :string(255)
#  access_token    :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :age, :fb_id, :first_name, :last_name, :liked
  has_many :user_likes, dependent: :destroy


  def liked_by(user)
  	user.user_likes.where(target_user_id: self.id)
  end

  def liked_by?(user)
  	liked_by(user).present?
  end
end
