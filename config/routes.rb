Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #before refactoring using resources:
  #get '/artists/:artist_id/songs', to: 'artist_songs#index'
  #get '/artists', to: 'artists#index'
  #get '/artists/new', to: 'artists#new'
  #post '/artists', to: 'artists#create'
  #get '/artists/:id/edit', to: 'artists#edit'
  #patch '/artists/:id', to: 'artists#update'
  #delete '/artists/:id', to: 'artists#destroy'
  #get '/songs', to: 'songs#index'
  #get '/songs/:id', to: 'songs#show'
  #get '/playlists', to: 'playlists#index'
  
  resources :songs, only: [:index, :show]

  resources :artists do
    resources :songs, only: [:index], controller: "artist_songs"
  end
  
  resources :playlists, only: [:index]
  
  patch '/cart/:song_id', to: 'cart#update'
  

end
