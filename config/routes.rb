Rails.application.routes.draw do
  resources :buyers
  resources :providers
  resources :products
  get 'purchases/index'
  root 'purchases#index'
  get 'uploads/index'
  post '/uploads/import', to: 'uploads#import'
end
