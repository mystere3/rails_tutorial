Rails.application.routes.draw do
  devise_for :writers
  get 'welcome/index'
  
  resources :articles do
    resources :comments
    resources :tags
  end

  # get 'writers/login', to: 'writers#login'
  # post 'writers/login', to: 'writers#login'

  # get '/validate', to: 'writers#show'

  resources :writers do
    resources :articles
  end
  
  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'

  delete '/logout', to: 'sessions#destroy'

  root 'welcome#index'

end
