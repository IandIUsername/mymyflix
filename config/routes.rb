
Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'
#   get 'myprofile/:user_id/:post_id'
  get 'video_index' => 'videos#index'
  get 'videos/:id' => 'videos#show', as: 'video'
  get 'home' => 'videos#index', as: 'home'
  root to: 'videos#index'
  
end
