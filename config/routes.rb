Rails.application.routes.draw do
  resources :reviews, only: [:destroy]
  resources :restaurants do
    resources :reviews, only: [:new, :create]




    collection do
      get :top
    end
    member do
      get :chef
    end
  end
end

# post '/restaurants/:restaurant_id/reviews'
# get '/restaurants/:id/chef', to: 'restaurants#chef'
# get '/restaurants/top', to: 'restaurants#top', as: :top_restaurants
# collection -> when it effects all restaurants
# member     -> when it effects only one restaurant


# See all restaurants -> index
# See details about one restaurant -> show
# Create a restaurant -> new/create
# Update a restaurant
# Destroy a restaurant

# The prefix is ONLY attached to the path
# restaurants_path, method: :post
# restaurant_path(restaurant), method: :patch
# restaurant_path(restaurant), method: :delete
