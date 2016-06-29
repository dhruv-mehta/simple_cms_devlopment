class SectionController < ApplicationController
   
  layout false

  def index
    @section=Section.sorted
  end

  def show
    @section=Section.find(params[:id])
  end

  def new
    @section=Section.new(:name =>'default', :visible => 'false')
  end

  def create
      @section=Section.new(section_params)

            if @section.save

              flash[:notice]= "record #{@section.name} saved successfully......"
              redirect_to(:action => 'index')
            else

              render('new')
            end 
  end

  def edit
    @section=Section.find(params[:id])
  end

   def update

    @section=Section.find(params[:id])

          if    @section.update_attributes(section_params)

              flash[:notice]= "record #{@section.name} updated successfully......."

              redirect_to(:action => 'show' , :id => @section.id)
            else

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
