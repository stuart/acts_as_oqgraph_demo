class CellsController < ApplicationController
  before_filter :find_model
  
  def show
    
  end
  
  private
  def find_model
    @cell = Cell.find(params[:id]) if params[:id]
  end
end