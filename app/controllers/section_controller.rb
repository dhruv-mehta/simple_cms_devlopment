class SectionController < ApplicationController

   
  layout "admin"

before_action :confirm_logged_in
before_action :find_pages
  def index
     @section = Section.where(:page_id => @page.id).sorted
        # @section=Section.sorted
  end

  def show
    @section=Section.find(params[:id])
  end

  def new
    @section=Section.new(:name =>'default', :visible => 'false' , :page_id => @page.id)
    @section_count=Section.count + 1
    @pages = Page.order('position ASC')
  end

  def create
      @section=Section.new(section_params , :page_id => @page.id)
      @section_count = Section.count
       @pages = Page.order('position ASC')

            if @section.save

              flash[:notice]= "record #{@section.name} saved successfully......"
              redirect_to(:action => 'index' , :page_id => @page.id)
            else
              @section_count = Section.count
              render('new')
            end 
  end

  def edit
    @section=Section.find(params[:id])
    @section_count = Section.count
 
     @pages = Page.order('position ASC')
  end

   def update

    @section=Section.find(params[:id])

          if    @section.update_attributes(section_params)

              flash[:notice]= "record #{@section.name} updated successfully......."

              redirect_to(:action => 'show' , :id => @section.id , :page_id => @page.id)
            else
              @Section_count = Section.count
               @pages = Page.order('position ASC')
              render('new')
            end 
  end

  def delete
    @section=Section.find(params[:id])
  end

  def destroy

    @section=Section.find(params[:id])
    @section.destroy
    flash[:notice]= "record deleted successfully......."
    redirect_to(:action => 'index' , :page_id => @page.id)
  end

  private 

  def section_params


            params.require(:section).permit(:page_id  , :name, :position , :visible , :content_type, :content)
  end


  def find_pages
    if params[:page_id]
      @page =Page.find(params[:page_id])
    end
  end
end
