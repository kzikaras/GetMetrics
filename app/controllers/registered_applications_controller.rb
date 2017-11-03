class RegisteredApplicationsController < ApplicationController

  def index
    @application = Application.all
  end

  def new
    @application = Application.new 
  end

  def create
    @application = Application.new 
    @application.name = params[:application][:name]
    @application.URL = params[:application][:URL]
    @application.user_id = current_user.id
    
    Application.all.each do |name|
      if name == @application.name
        flash[:notice] = "Application already exists!"
        render :new
      end
    end

    if @application.save
      flash[:notice] = "App was saved!"
      redirect_to root_path
    
    else
      flash.now[:notice] = "There was an error saving your app."
      render :new
    end
  end
  

  def show
    @application = Application.find(params[:id])
    @events = @application.events.group_by(&:event_name)
  end

  def update
  end

  def destroy
    @application = Application.find(params[:id])

    if @application.destroy
      flash[:notice] = "\"#{@application.name}\" was deleted successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error deleting the app."
      render :show
    end
  end

end
