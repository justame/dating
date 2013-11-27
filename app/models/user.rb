class User < ActiveRecord::Base
  attr_accessible :age, :fb_id, :first_name, :last_name
end
