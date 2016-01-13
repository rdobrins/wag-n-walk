Rails.application.routes.draw do
  devise_for :users

  root 'walks#index'

end
