class SpacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
    # if filter then @spaces.where()
    # else all spaces
    @spaces = Space.all
  end

  def show
    # booking form Booking.new
    # reviews Review.all/find/where
    # if current_user? AND user.spaces.select { space == @space }  then show review form
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user

    if @space.save
      redirect_to @space, notice: 'Space was successfully created.'
      # redirect to dashboard?
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @space.update(space_params)
      redirect_to @space, notice: 'Space was successfully updated.'
      # redirect to dashboard?
    else
      render :edit
    end
  end

  def destroy
    @space.destroy
    redirect_to root_path, notice: 'Space was successfully destroyed.'
    # redirect to dashboard?
  end

  private

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(:space, :title, :description, :address, :price, :capacity, :wifi)
  end
end
