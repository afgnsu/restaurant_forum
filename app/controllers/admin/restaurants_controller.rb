class Admin::RestaurantsController < ApplicationController

  before_action :set_restaurant, only: [:show, :edit, :update]
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant was successfully created"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "Restaurant was failed to create"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @restaurant = Restaurant.update(restaurant_params)
      flash[:notice] = "Restaurant was successfully updated"
      redirect_to admin_restaurants_path(@restaurant)
    else
      flash[:alert] = "Restaurant was failed to create"
      render :edit
    end
  end
  

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description)
  end


end
