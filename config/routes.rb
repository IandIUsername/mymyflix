
Myflix::Application.routes.draw do
  
  get 'my_queue', to: 'queue_items#index'
 # get 'ui(/:action)', controller: 'ui'
 
  resources :videos, only: [:show] do
    collection do 
      post :search, to: "videos#search"
    end
    resources :reviews, only: [:create]
  end
  
  resources :users, only: [:create]
  resources :sessions, only: [:create]
  
  get 'register' => 'users#new'
  get 'front'    => 'pages#front'
  get 'sign_in'  => 'sessions#new'
  get 'home'     => 'videos#index', as: 'home'
  get 'sign_out' =>  'sessions#destroy', as: 'sign_out'
  get 'categories/:id' => 'categories#show', as: 'category'
  
  #get 'myprofile/:user_id/:post_id'
  #get 'video_index' => 'videos#index'
  #get 'videos/:id' => 'videos#show', as: 'video'
  #get 'home' => 'videos#index', as: 'home'
  root to: 'pages#front'
  
end
