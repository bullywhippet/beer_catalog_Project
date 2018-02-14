Rails.application.routes.draw do
  get 'static_pages/home'

  root 'static_pages#home'
  get 'static_pages/about'

  resources :breweries
  resources :beers
  resources :styles
end
