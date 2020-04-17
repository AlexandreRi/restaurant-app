class RestaurantsController < ApplicationController
before_action :set_restaurant, only: [:chef, :show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def top
    @restaurants = Restaurant.where(stars: 5)
  end

  def chef
    @chef_name = @restaurant.chef_name
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurant)
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def params_restaurant
    params.require(:restaurant).permit(:name, :address, :stars)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end

