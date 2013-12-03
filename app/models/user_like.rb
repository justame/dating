# == Schema Information
#
# Table name: user_likes
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  target_user_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class UserLike < ActiveRecord::Base
  attr_accessible :user_id, :target_user_id
  belongs_to :user
 	validates :user_id, :target_user_id, :presence => true

end

