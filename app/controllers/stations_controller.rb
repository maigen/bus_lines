class StationsController < ApplicationController
  def index
    @stations = Station.all
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(params[:station])

    if @station.save
      flash[:notice] = "station created."
      redirect_to stations_path
    else
      render 'new'
    end
  end

  def show
    @station = Station.find(params[:id])
  end

  def update
    @station = Station.find(params[:id])

    if @station.update(params[:station])
      flash[:notice] = "station updated."
      render("show.html.erb")
    else
      flash[:notice] = "Check for errors."
      redirect_to("edit.html.erb")
    end
  end

  def edit
    @station = Station.find(params[:id])
  end

  def destroy
    @station = Station.find(params[:id])
    if @station.destroy
      flash[:notice] = "station deleted."
      redirect_to stations_path
    else
      flash[:notice] = "station NOT deleted."
      redirect_to stations_path(@station.id)
    end
  end
end
