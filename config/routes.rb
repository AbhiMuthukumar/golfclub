Rails.application.routes.draw do

  root 'booking#index'
  # get 'booking/index'

  get '/register' => 'users#new'
  post '/register' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :booking, :only => [:index, :new, :create, :destroy]

  post '/check_availability' => 'booking#check'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
