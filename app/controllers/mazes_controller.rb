class MazesController < ApplicationController
  before_filter :find_model

  def index
    @mazes = Maze.all
  end
  
  def show
    @cell = @maze.cells.find(:first, :conditions => {:x => params[:x] || 0 , :y => params[:y] || 0})
    redirect_to @cell
  end
  
  private
  def find_model
    @maze = Maze.find(params[:id]) if params[:id]
  end
end