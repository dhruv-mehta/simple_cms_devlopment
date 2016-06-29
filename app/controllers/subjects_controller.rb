class SubjectsController < ApplicationController
  
  layout false

  def index
    @subject=Subject.sorted
  end

  def show
    @subject=Subject.find(params[:id])
  end

  def new
    @subject=Subject.new(:name =>'default' , :visible => 'false')
  end

  def create
      @subject=Subject.new(subject_params)

            if @subject.save

              flash[:notice]= "record #{@subject.name} saved successfully......"
              redirect_to(:action => 'index')
            else

              render('new')
            end 
  end

  def edit
    @subject=Subject.find(params[:id])
  end

   def update

    @subject=Subject.find(params[:id])

          if    @subject.update_attributes(subject_params)

              flash[:notice]= "record #{@subject.name} updated successfully......."

              redirect_to(:action => 'show' , :id => @subject.id)
            else

              render('new')
            end 
  end

  def delete
    @subject=Subject.find(params[:id])
  end

  def destroy

    @subject=Subject.find(params[:id])
    @subject.destroy
    flash[:notice]= "record deleted successfully......."
    redirect_to(:action => 'index')
  end

  private 

  def subject_params


            params.require(:subject).permit(:name, :position , :visible)
  end
end
