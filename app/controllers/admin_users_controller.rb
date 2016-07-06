class AdminUsersController < ApplicationController
  
  layout "admin"

  before_action :confirm_logged_in

              def index
                @adminuser=AdminUser.sorted
              end

              def show
                @adminuser=AdminUser.find(params[:id])
              end

              def new
                @adminuser=AdminUser.new(:first_name =>'default')
                @adminuser_count=AdminUser.count + 1
              end

              def create
                  @adminuser=AdminUser.new(adminuser_params)

                        if @adminuser.save

                          flash[:notice]= "record saved successfully......"
                          redirect_to(:action => 'index')
                        else
                          @adminuser_count=AdminUser.count
                          render('new')
                        end 
           
            end

             def edit
                   puts  @adminuser=AdminUser.find(params[:id])
                    @adminuser_count=AdminUser.count
             end

   def update

    @adminuser=AdminUser.find(params[:id])

          if @adminuser.update_attributes(adminuser_params)

              flash[:notice]= "record updated successfully......."

              redirect_to(:action => 'index')
          else
              @adminuser_count=AdminUser.count
              render('new')
          end 
  end

  def delete
    @adminuser=AdminUser.find(params[:id])
  end

  def destroy

    @adminuser=AdminUser.find(params[:id])
    @adminuser.destroy
    flash[:notice]= "record deleted successfully......."
    redirect_to(:action => 'index')
  end

def changepass
  redirect_to(:action => 'index') 
end

  private 

  def adminuser_params
    params.require(:admin_user).permit(:first_name, :last_name , :email , :username , :password)
  end
end
