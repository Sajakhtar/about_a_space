class SpacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    # if filter then @spaces.where()
    # else all spaces
    @spaces = policy_scope(Space)

    @markers = @spaces.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
        info_window: render_to_string(partial: "info_window", locals: { space: space }),
        image_url: helpers.asset_url('buildings.svg')

      }
    end

  end

  def show
    # booking form Booking.new
    # reviews Review.all/find/where
    # if current_user? AND user.spaces.select { space == @space }  then show review form
    authorize @space

    @booking = Booking.new

    @markers = [{
      lat: @space.latitude,
      lng: @space.longitude,
      info_window: render_to_string(partial: "info_window", locals: { space: @space }),
      image_url: helpers.asset_url('buildings.svg')

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
      redirect_to @space, notice: 'Space was successfully created.'
      # redirect to dashboard?
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
      redirect_to @space, notice: 'Space was successfully updated.'
      # redirect to dashboard?
    else
      render :edit
    end
  end

  def destroy
    authorize @space

    @space.destroy
    redirect_to spaces_path, notice: 'Space was successfully destroyed.'
    # redirect to dashboard?
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:space, :title, :description, :address, :price, :capacity, :wifi, photos: [])
  end
end
