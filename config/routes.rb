Rails.application.routes.draw do
  
  get 'users/show'

  devise_for :users
    resources :users, only: [:show]
  
  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:create, :destroy]
    end
  end

  
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  post :incoming, to: 'incoming#create'
end
