class VideosController < ApplicationController

  
  def index
    
    @categories = Category.all
    @search = Video.search_by_title(params[:search_by_title])
    @videos = Video.all
    comedy = Category.first
    drama = Category.second
    @comedies = Video.where(category_id: 1)
    @drama    = Video.where(category_id: 2)
    @comedies = comedy.videos
    @dramas = drama.videos   
  end
  
  def show
    @video = Video.find(params[:id])
  end

end

