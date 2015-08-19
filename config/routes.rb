Rails.application.routes.draw do
  
  resources :topics

  devise_for :users
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  post :incoming, to: 'incoming#create'
end
