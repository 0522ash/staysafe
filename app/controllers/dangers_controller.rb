class DangersController < ApplicationController
  before_action :set_danger, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @dangers = Danger.includes(:user)
  end

  def new
    @danger = Danger.new
  end

  def create
    @danger = Danger.new(danger_params)
    if @danger.save
      redirect_to dangers_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @danger.update(danger_params)
      redirect_to danger_path(@danger)
    else
      render :edit
    end
  end

  def destroy
    if @danger.destroy
      redirect_to dangers_path
    else
      redirect_to dangers_path
    end
  end

  private

  def danger_params
    params.require(:danger).permit(:title, :content, :image, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @danger.user
  end

  def set_danger
    @danger = Danger.find(params[:id])
  end
end
