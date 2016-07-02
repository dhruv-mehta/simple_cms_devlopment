class Section < ActiveRecord::Base

	 

	has_many :section_edits
	has_many :editors , :through => :section_edits , :class_name => "AdminUser"

	CONTENT_TYPES = ['text' , 'html']

	 validates :name , presence: true
	 validates_length_of :name , :maximum => 255
	 validates_inclusion_of :content_type , :in => CONTENT_TYPES
	 :message => "must be one of the :{CONTENT_TYPES.join(' ,')}"
	 validates_presence_of :content_type

	scope :visible , lambda { where( :visible => true )  }
	scope :invisible , lambda { where(:visible => false) }
	scope :sorted ,lambda { order("sections.position ASC") }
	scope :new_first ,lambda { order("sections.created_at DESC") }
	scope :search ,lambda { |query|  }
end
