class SpacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    @spaces = policy_scope(Space)

    session[:dates] = params[:date] if params[:date].present?

    if params[:query].present? && params[:date].present?
      search_results = Space.search_spaces(params[:query])
      dates = params[:date].split(' to ')
      spaces_booked = Space.joins(:bookings).where(bookings: { date_from: dates[0]..dates[1] })
      @spaces = search_results.where.not(id: spaces_booked)
    elsif params[:query].present?
      @spaces = Space.search_spaces(params[:query])
    elsif params[:date].present?
      dates = params[:date].split(' to ')
      spaces_booked = Space.joins(:bookings).where(bookings: { date_from: dates[0]..dates[1] })
      @spaces = Space.where.not(id: spaces_booked)
    else
      @spaces = Space.all
    end

    @markers = @spaces.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
        info_window: render_to_string(partial: "info_window", locals: { space: space }),
        image_url: helpers.asset_url('skyscraper.svg')

      }
    end
  end

  def show
    authorize @space

    @has_bookings = !@space.bookings.empty?
    if @has_bookings
      @unavailable_dates = @space.bookings.map { |booking| { from: booking.date_from.to_s, to: booking.date_to.to_s } }
    end
    # raise
    @booking = Booking.new
    @review = Review.new
    @allow_review = Booking.where(user: current_user, space: @space).empty?

    @markers = [{
      lat: @space.latitude,
      lng: @space.longitude,
      info_window: render_to_string(partial: "info_window", locals: { space: @space }),
      image_url: helpers.asset_url('skyscraper.svg')

    }]
  end

  def new
    @space = Space.new
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user

    authorize @space
    if @space.save
      redirect_to @space, notice: 'Your New Venture was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @space
  end

  def update
    authorize @space

    if @space.update(space_params)
      redirect_to @space, notice: 'Your New Venture was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @space

    @space.destroy
    redirect_to my_account_path, notice: 'Your New Venture was successfully deleted.'
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:space, :title, :description, :address, :price, :capacity, :wifi, photos: [])
  end
end
