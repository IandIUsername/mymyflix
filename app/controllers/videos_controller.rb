class VideosController < ApplicationController
  before_filter :require_user
  
  def index
    
    @categories = Category.all
    #@search = Video.search_by_title(params[:search_by_title])
    #@videos = Video.all
    
  end
  
  def show
    @video = Video.find(params[:id])
  end
  
  def search
    
    @search = Video.search_by_title(params[:search_by_title])
    
  end
  

end

