class Page < ActiveRecord::Base

	 validates :name , presence: true

	belongs_to :subject
	has_many :sections
	has_and_belongs_to_many  :editor , :class_name => "AdminUser"


	scope :visible , lambda { where( :visible => true )  }
	scope :invisible , lambda { where(:visible => false) }
	scope :sorted ,lambda { order("pages.position ASC") }
	scope :new_first ,lambda { order("pages.created_at DESC") }
	scope :search ,lambda { |query|  }
end
	