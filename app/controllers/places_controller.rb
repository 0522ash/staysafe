class PlacesController < ApplicationController
  before_action :set_place, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @places = Place.includes(:user)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      render :edit
    end
  end

  def destroy
    if @place.destroy
      redirect_to places_path
    else
      redirect_to places_path
    end
  end

  private

  def place_params
    params.require(:place).permit(:title, :content, :image, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @place.user
  end

  def set_place
    @place = Place.find(params[:id])
  end
end
