class PlacesController < ApplicationController
   before_filter :authorize, only: [:index]

  def index
    @places = Place.all
  end

  def new
    @user = current_user
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
       redirect_to places_path
    else
      render "new"
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def destroy
    @place = Place.new(place_params)
    if @place.destroy
      flash[:notice] = "Place destoyed!"
      redirect_to places_path
    end
  end

private

  def place_params
    params.require(:place).permit(:title,
                                  :description,
                                  :user_id)
  end
end

