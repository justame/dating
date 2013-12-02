class AccessTokenToUser < ActiveRecord::Migration
  def up
  	 add_column :users, :fb_access_token, :string
  	 add_column :users, :access_token, :string
  end

  def down
  end
end
