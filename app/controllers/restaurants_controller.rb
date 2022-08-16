class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :top, :show]

  def top
    @restaurants = Restaurant.where(rating: 5)
    # render :top
  end

  def chef
    @restaurant = Restaurant.find(params[:id])
  end

  def index
    @restaurants = Restaurant.all
    # render :index
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    # this instance is for the form
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # render 'new.html.erb'
      # redirect_to new_restaurant_path
      render :new
    end
  end

  def edit
    # this instance is for the form
    @restaurant = Restaurant.find(params[:id])
    redirect_to restaurants_path, notice: 'You are not allowed to edit this restaurant' if current_user != @restaurant.user
  end
  
  def update
    @restaurant = Restaurant.find(params[:id])
    redirect_to restaurants_path, notice: 'You are not allowed to edit this restaurant' if current_user != @restaurant.user

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      # if it fails, show the edit form again
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  # strong params -> whitelisting the attributes that the user can give us
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating, :category)
  end
end
