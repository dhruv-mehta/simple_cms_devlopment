class AdminUser < ActiveRecord::Base

has_secure_password	

has_and_belongs_to_many  :pages
has_many 				 :section_edits
has_many                 :section , :through => :section_edits
	#to configure a different table name :
	#self.table_name= "admin_user"

	 # validates_presence_of :first_name
	 # validates_length_of :first_name , :maximum => 25
		
	 # validates_presence_of :last_name
	 # validates_length_of :last_name , :maximum => 50
	 
	 # validates_presence_of :username
	 # validates_length_of :username, :within => 8..20
	 # validates_uniqueness_of :username

	 	 
	 # validates_presence_of :email
	 # validates_length_of :email , :maximum => 100
	 # validates_confirmation_of :email
	 # validates_format_of :email, :with => /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
	 email_regex = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ 
validates :first_name , :presence => true , :length => {:maximum => 25}			

validates :last_name , :presence => true , :length => {:maximum => 50}	

validates :username , :presence => true , :length => {:within => 8..25} , :uniqueness => true	

validates :email , :presence => true , :length => {:maximum => 25} , :format => email_regex , :confirmation => true

scope 	:sorted , lambda {order("last_name ASC , first_name ASC")}

def name
	
	"#{first_name} #{last_name}"

end


end
