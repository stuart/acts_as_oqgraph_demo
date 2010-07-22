class OqgraphUsersController < ApplicationController
  before_filter :find_model

  def index
    @users = OqgraphUser.all
  end
  
  def show
    
  end
  
  def show_path
    @other = OqgraphUser.find(params[:other_id])
    @users = @user.shortest_path_to(@other)
  end
  
  private
  def find_model
    @user = OqgraphUser.find(params[:id]) if params[:id]
  end
end