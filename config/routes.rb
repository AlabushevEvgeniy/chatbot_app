Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :facebook do
    resources :webhooks, only: [:index, :post]
    resources :messages, only: [:create]
  end
end
