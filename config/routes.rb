Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :caregivers, :requesters

  root "roles#index"

  scope :path => '/api/v1/', :module => "api_v1", :defaults => { :format => :json }, :as => 'v1' do

    post "/login" => "auth#login"
    post "/logout" => "auth#logout"

  end

end
