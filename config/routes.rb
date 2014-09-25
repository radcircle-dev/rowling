Rails.application.routes.draw do

  root 'posts#index'

  resources :users
  resources :posts

  get 'signup', to: 'users#new', as: 'signup'
  get 'me', to: 'users#show', as: 'me'

  # Routing /dashboard to the users#dashboard method
  get 'dashboard', to: 'users#dashboard', as: 'dashboard'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    get 'logout' => :destroy
  end

end