Rails.application.routes.draw do

  root 'users#splash'

  resources :users, :rides

end
