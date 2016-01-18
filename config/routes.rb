Rails.application.routes.draw do
  devise_for :users

  root 'landing#home'

  resources :users do
    resources :dogs do
    end
  end
end
