class PagesController < ApplicationController
  
  layout false

  def index
    @page=Page.sorted
  end

  def show
    @page=Page.find(params[:id])
  end

  def new
    @page=Page.new(:name =>'default', :visible => 'false')
  end

  def create
      @page = Page.new(page_params)

            if @page.save

              flash[:notice]= "record #{@page.name} saved successfully......"
              redirect_to(:action => 'index')
            else

              render('new')
            end 
  end

  def edit
    @page=Page.find(params[:id])
  end

   def update

    @page=Page.find(params[:id])

          if    @page.update_attributes(page_params)

              flash[:notice]= "record #{@page.name} updated successfully......."

              redirect_to(:action => 'show' , :id => @page.id)
            else

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
