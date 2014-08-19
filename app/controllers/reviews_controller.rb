class ReviewsController < ApplicationController

  before_filter :require_user
  
def create
  
  @video = Video.find(params[:video_id])
  @review = @video.reviews.build(review_params)
  @review.user = current_user
  if @review.save
    flash.notice = "the big bopper says you have created a review"
    redirect_to video_path(@video)
  else
    @reviews = @video.reviews.reload
    flash.notice = "Error, Will Robinson, error"
    render "videos/show"
  end
  
# @review = Review.create(review_params)

#     @video = Video.find(params[:video_id])
#     @review.video_id = @video.id
#     @review.user = current_user
#     if @review.save
#     #@review.video.id = @video.id
#     flash.notice = "A review has been created"
#     redirect_to video_path(@video)
#     #video_path(@review.video.id)
#   else
#     flash.notice = "There is a problem with your review"
#     redirect_to :back
#   end

end

  def review_params
    params.require(:review).permit(:title, :review, :rating, :content, :user_id, :video_id, :reviewable_id, :reviewable_type, :id)
  end

end