Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :articles do
    resources :comments
  end

  get 'writers/login', to: 'writers#login'
  post 'writers/login', to: 'writers#login'

  get '/validate', to: 'writers#show'

  resources :writers do
    resources :articles
  end
  

  root 'welcome#index'

end
