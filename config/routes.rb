Rails.application.routes.draw do
  devise_for :users, :caregivers, :requesters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :caregivers, :requesters

  root "welcome#index"
end
