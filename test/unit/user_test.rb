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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
