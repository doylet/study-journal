Rails.application.routes.draw do
  root 'tags#index'
  resources :articles do
    resources :comments
  end
  resources :tags do
    resources :articles
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
