Rails.application.routes.draw do

  root 'users#splash'

  resources :users, :rides
  resources :sessions, only: [:new, :create, :destroy]
  delete 'logout'  => 'sessions#destroy'

end
