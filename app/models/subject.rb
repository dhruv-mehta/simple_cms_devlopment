class Subject < ActiveRecord::Base

	has_many :pages ,dependent: :destroy
	acts_as_list

	 validates :name, presence: true
	 validates_length_of :name , :maximum => 255

	# validate_presence_of :name

	scope :visible , lambda { where( :visible => true )  }
	scope :invisible , lambda { where(:visible => false) }
	scope :sorted ,lambda { order("subjects.position ASC") }
	scope :new_first ,lambda { order("subjects.created_at DESC") }
	scope :search ,lambda { |query|  

			where (["name LIKE  ?", "%#{query}%"])
	}

end
