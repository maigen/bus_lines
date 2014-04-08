class StopsController < ApplicationController
  def index
    @stop = Stop.new
    @stops = Stop.all
    @stations = Station.all
    @lines = Line.all
  end

  def new
    @stop = Stop.new
  end

  def create
    @station = Station.find(params[:id])
    @line = Line.find(params[:id])
    @stop = Stop.new(params[:stop])

    if @stop.save
      flash[:notice] = "Stop Created."
      redirect_to stops_path
    else
      render 'new'
    end
  end

  def show
    @stop = Stop.find(params[:id])
  end

  def update
    @stop = Stop.find(params[:id])

    if @stop.update(params[:stop])
      flash[:notice] = "stop updated."
      render("show.html.erb")
    else
      flash[:notice] = "Check for errors."
      redirect_to("edit.html.erb")
    end
  end

  def edit
    @stop = Stop.find(params[:id])
  end

  def destroy
    @stop = Stop.find(params[:id])
    if @stop.destroy
      flash[:notice] = "Stop deleted."
      redirect_to stops_path
    else
      flash[:notice] = "Stop NOT deleted."
      redirect_to stops_path(@stop.id)
    end
  end
end
