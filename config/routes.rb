Rails.application.routes.draw do
  # verb '/path', to: 'controller#action', as: :prefix
  # Create
  # we need a page for the form
  get '/restaurants/new', to: 'restaurants#new', as: :new_restaurant
  # we need a palce to send the form information
  post '/restaurants', to: 'restaurants#create', as: :restaurants

  # Read
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:id', to: 'restaurants#show', as: :restaurant


  # Update
  # we need a page for the form
  get '/restaurants/:id/edit', to: 'restaurants#edit', as: :edit_restaurant
  # we need a palce to send the form information
  patch '/restaurants/:id', to: 'restaurants#update'

  # Destroy
  delete '/restaurants/:id', to: 'restaurants#destroy'
end


# See all restaurants -> index
# See details about one restaurant -> show
# Create a restaurant -> new/create
# Update a restaurant
# Destroy a restaurant

# The prefix is ONLY attached to the path
# restaurants_path, method: :post
# restaurant_path(restaurant), method: :patch
# restaurant_path(restaurant), method: :delete
