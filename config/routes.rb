Rails.application.routes.draw do
  root to: 'users#index'

  get  '/register'   => 'users#new'
  post '/register' => 'users#create'

  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
