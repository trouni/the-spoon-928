class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :top, :show]

  def top
    @restaurants = policy_scope(Restaurant).where(rating: 5)
    skip_authorization
    # render :top
  end

  def index
    @restaurants = policy_scope(Restaurant) # returns only the restaurants that the user is allowed to see

    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        popup_html: render_to_string(partial: 'restaurants/map_popup', locals: { restaurant: restaurant }),
        marker_html: render_to_string(partial: 'restaurants/map_marker', locals: { restaurant: restaurant })
      }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant # check if the current_user is allowed to perform this action (show) with the @restaurant
    # ⚠️ `authorize` does not mean we grant access
  end

  def new
    # this instance is for the form
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant

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
    authorize @restaurant # the `@restaurant` on the left of the `authorize` is passed as the `record` in the policy
  end
  
  def update
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant

    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      # if it fails, show the edit form again
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  # strong params -> whitelisting the attributes that the user can give us
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating, :category)
  end
end
