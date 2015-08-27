Rails.application.routes.draw do
  
  devise_for :users
  
  resources :topics do
    resources :bookmarks, except: [:index] do
      resources :likes, only: [:create, :destroy]
    end
  end

  
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
  post :incoming, to: 'incoming#create'
end
