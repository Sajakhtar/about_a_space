class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @space = Space.find(params[:space_id])
    @review.space = @space
    @booking = Booking.new

    authorize @review

    if @review.save
      redirect_to space_path(@space, anchor: "review-#{@review.id}"), notice: 'Review was successfully created.'
    else
      render 'spaces/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
