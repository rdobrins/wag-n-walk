Rails.application.routes.draw do
  devise_for :users

  root 'landing#home'

  resources :dogs, only: :none do
    resources :memberships, only: [:create, :destroy]
  end
  resources :users do
    resources :dogs
    resources :walks
  end
end
