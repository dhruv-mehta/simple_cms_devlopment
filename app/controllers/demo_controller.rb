class DemoController < ApplicationController
	layout 'application'
  def index	
  end

  def hello

  	#render('index')
  	@array=[1,2,3,4,5,6]
  	@id=params['id'].to_i
  	@page=params[:page].to_i

  end

  def change
  	
  	redirect_to(:controller => 'demo' , :action => 'index')
  end

  def text_helper
    
  end
end
