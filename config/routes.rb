Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :facebook do
    resources :webhooks, only: [:index, :create]
    resources :messages, only: [:create]
  end
end
