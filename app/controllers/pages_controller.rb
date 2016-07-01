class PagesController < ApplicationController
  
  layout "admin"

  def index
    @page=Page.sorted
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
    @page=Page.new(:name =>'default', :visible => 'false')
    @page_count=Page.count + 1
    @subjects = Subject.order('position ASC')
    
  end

  def create
      @page = Page.new(page_params)
       @page_count=Page.count + 1
       @subjects = Subject.order('position ASC')

            if @page.save

              flash[:notice]= "record #{@page.name} saved successfully......"
              redirect_to(:action => 'index')
            else
              @page_count=Page.count
              @subjects = Subject.order('position ASC')
              render('new')
            end 
  end

  def edit
    @page=Page.find(params[:id])
    @page_count=Page.count
    @subjects = Subject.order('position ASC')

  end

   def update

    @page=Page.find(params[:id])

          if    @page.update_attributes(page_params)

              flash[:notice]= "record #{@page.name} updated successfully......."

              redirect_to(:action => 'show' , :id => @page.id)
            else
              @page_count=Page.count
              @subjects = Subject.order('position ASC')  
              render('new')
            end 
  end

  def delete
    @page=Page.find(params[:id])
  end

  def destroy

    @page=Page.find(params[:id])
    @page.destroy
    flash[:notice]= "record deleted successfully......."
    redirect_to(:action => 'index')
  end

  private 

  def page_params


            params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end
end
