class AddPasswordDigestToAdmnUser < ActiveRecord::Migration
  def up

  	  	remove_column "admin_users" , "hashed_password" , :string
  	add_column "admin_users" , "password_digest" , :string
  end

  def down
  	
  	add_column "admin_users" , "hashed_password" , :string , :limit => 40
  	remove_column "admin_users" , "password_digest" , :string

  end
end
