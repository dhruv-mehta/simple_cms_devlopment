class SectionController < ApplicationController
   
  layout "admin"

  def index
    @section=Section.sorted
  end

  def show
    @section=Section.find(params[:id])
  end

  def new
    @section=Section.new(:name =>'default', :visible => 'false')
    @section_count=Section.count + 1
    puts Section.count + 1
  end

  def create
      @section=Section.new(section_params)
      @Section_count = Section.count

            if @section.save

              flash[:notice]= "record #{@section.name} saved successfully......"
              redirect_to(:action => 'index')
            else
              @Section_count = Section.count
              render('new')
            end 
  end

  def edit
    @section=Section.find(params[:id])
    @Section_count = Section.count
    puts @section_count
  end

   def update

    @section=Section.find(params[:id])

          if    @section.update_attributes(section_params)

              flash[:notice]= "record #{@section.name} updated successfully......."

              redirect_to(:action => 'show' , :id => @section.id)
            else
              @Section_count = Section.count
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
    redirect_to(:action => 'index')
  end

  private 

  def section_params


            params.require(:section).permit(:page_id  , :name, :position , :visible , :content_type, :content)
  end
end
