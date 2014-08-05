
Myflix::Application.routes.draw do
  
  
  get 'ui(/:action)', controller: 'ui'

  resources :videos, only: [:show] do
    collection do 
      get :search, to: "videos#search"
    end
  end
  
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  
  get 'register' => 'users#new'
  get 'front'    => 'pages#front'
  get 'sign_in'  => 'sessions#new'
  get 'home'     => 'videos#index', as: 'home'
  get 'sign_out' =>  'sessions#destroy', as: 'sign_out'
  
  #get 'myprofile/:user_id/:post_id'
  #get 'video_index' => 'videos#index'
  #get 'videos/:id' => 'videos#show', as: 'video'
  #get 'home' => 'videos#index', as: 'home'
  root to: 'sessions#new'
  
end
