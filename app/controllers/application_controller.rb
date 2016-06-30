class ApplicationController < ActionController::Base


	def status_tag(boolean , options={})
		
		options[:true_text] ||= ''
		options[:false_text] ||= ''

		if boolean
			content_tag(:span , options[:true_text], :class => 'status true')
		else
		content_tag(:span, options[:false_text], :class => 'status false')	
		end
	end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
