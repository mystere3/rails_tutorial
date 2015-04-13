Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :articles do
    resources :comments
  end

  resources :writers do
    resources :articles
  end
  
  get 'writers/login', to: 'writers#login'
  post 'writers/login', to: 'writers#login'

  root 'welcome#index'

end
