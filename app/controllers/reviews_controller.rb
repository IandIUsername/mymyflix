class ReviewsController < ApplicationController

def create
  
  video = Video.find(params[:video_id])
  video.reviews.create(review_params)
  redirect_to video
  
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