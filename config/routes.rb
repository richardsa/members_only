Rails.application.routes.draw do
  resources :posts, only: [:new, :create, :index]
  get 'posts/new'

  root                'sessions#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
end
