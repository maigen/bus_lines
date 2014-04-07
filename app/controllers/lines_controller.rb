class LinesController < ApplicationController
  def index
    @lines = Line.all
  end

  def new
    @line = Line.new
  end

  def create
    @line = Line.new(params[:line])

    if @line.save
      flash[:notice] = "Line created."
      redirect_to lines_path
    else
      render 'new'
    end
  end

  def show
    @line = Line.find(params[:id])
    @stations = @line.stations
  end

  def update
    @line = Line.find(params[:id])
    @stations = @line.stations

    if @line.update(params[:line])
      flash[:notice] = "Line updated."
      render("show.html.erb")
    else
      flash[:notice] = "Check for errors."
      redirect_to("edit.html.erb")
    end
  end

  def edit
    @line = Line.find(params[:id])
  end

  def destroy
    @line = Line.find(params[:id])
    if @line.destroy
      flash[:notice] = "Line deleted."
      redirect_to lines_path
    else
      flash[:notice] = "Line NOT deleted."
      redirect_to lines_path(@line.id)
    end
  end
end
