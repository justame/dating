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

require 'test_helper'

class UserLikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
