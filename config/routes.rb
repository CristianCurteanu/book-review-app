Rails.application.routes.draw do

  root to: 'users#index'

  # Users
  get  '/register'   => 'users#new'
  post '/register' => 'users#create'

  # Sessions
  get  '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # Books
  get '/books/:id', to: 'books#show', as: :books
  get '/book/new' => 'books#new'
  post '/books'    => 'books#create'
  delete '/books/:id' => 'books#destroy'

  # Reviews
  post '/review' => 'reviews#create'
end
