Rails.application.routes.draw do
  root to: 'profile#home'
  get '/profile/:id', to: 'profile#show'

  devise_for :users, path: 'auth'

  resources :kudos
  resources :users do
    get :kudos, to: 'kudos#show', on: :member
  end
end
