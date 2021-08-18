class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @space = Space.find(params[:space_id])
    @booking.space = @space
    @review = Review.new

    authorize @booking

    if @booking.save
      redirect_to my_account_path, notice: 'Booking was successfully created.'
    else
      render 'spaces/show'
    end
  end

  def destroy

    @booking = Booking.find(params[:id])

    authorize @booking

    @booking.destroy


    redirect_to my_account_path, notice: 'Booking was successfully cancelled.'
  end

  private

  def booking_params
    params.require(:booking).permit(:date_from, :date_to)
  end
end
