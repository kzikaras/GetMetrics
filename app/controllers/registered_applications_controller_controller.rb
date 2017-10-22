class RegisteredApplicationsControllerController < ApplicationController

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

    if @application.save
      flash[:notice] = "App was saved!"
      redirect_to @application
    else
      flash.now[:notice] = "There was an error saving your app."
      render :new
    end

  end

  def show
    @application = Application.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
