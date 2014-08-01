
Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
  resources :videos, only: [:show] do
    collection do 
      get :search, to: "videos#search"
    end
  end
#   get 'myprofile/:user_id/:post_id'
 # get 'video_index' => 'videos#index'
  #get 'videos/:id' => 'videos#show', as: 'video'
  #get 'home' => 'videos#index', as: 'home'
  root to: 'videos#index'
  
end
