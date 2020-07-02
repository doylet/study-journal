Rails.application.routes.draw do
 
  resources :authors
  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login'   => 'author_sessions#new'
  get 'logout'  => 'author_sessions#destroy'

  resources :courses do
    resources :articles do
      resources :comments
    end  
    resources :tags do
      resources :articles
    end
    resources :definitions
  end

  resources :articles do
    resources :comments
  end  
  
  resources :tags do
    resources :articles
  end

  root 'tags#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
