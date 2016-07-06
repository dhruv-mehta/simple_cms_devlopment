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


  def confirm_logged_in

  	unless session[:userid]

  		flash[:notice] = "please login again......"
  		redirect_to(:controller => 'access' , :action => 'login')
  		return false 
  		else
  			return true
  		end
	  end
end

