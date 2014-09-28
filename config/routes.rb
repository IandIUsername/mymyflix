
Myflix::Application.routes.draw do
  
  get 'people', to: 'relationships#index'
  
  get 'my_queue', to: 'queue_items#index'
  
 # get 'ui(/:action)', controller: 'ui'
 
  resources :videos, only: [:show] do
    collection do 
      post :search, to: "videos#search"
    end
    resources :reviews, only: [:create, :update]
  end
  
  resources :users, only: [:show, :create]
 
  resources :sessions, only: [:create]
  resources :queue_items, only: [:create,:destroy]

  resources :relationships, only: [:destroy]
  
  resources :password_resets, only: [:show, :create]
  
  get 'expired_token', to: 'password_resets#expired_token', as: 'expired_token'
  get 'forgot_password_confirmation', to:'forgot_passwords#confirm', as: 'forgot_password_confirmation'
  get  'forgot_password', to: 'forgot_passwords#new', as: 'forgot_password'
  resources :forgot_passwords, only: [:create]
  post 'relationships_create', to: 'relationships#create', as: 'relationships_create'
  post 'update_queue', to: 'queue_items#update_queue'
  get 'register' => 'users#new'
  get 'front'    => 'pages#front'
  get 'sign_in'  => 'sessions#new'
  get 'home'     => 'videos#index', as: 'home'
  get 'sign_out' =>  'sessions#destroy', as: 'sign_out'
  get 'categories/:id' => 'categories#show', as: 'category'
 
  root to: 'pages#front'
  
end
