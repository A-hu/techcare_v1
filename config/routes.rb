Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :caregivers, :requesters
  resources :schedules 
  get 'schedules/:requester_id/:date', :to => 'schedules#recent_days', :as => "schedules/recent_days"
  resources :health_records
  resources :comments
  root "schedules#index"

  scope :path => '/api/v1/', :module => "api_v1", :defaults => { :format => :json }, :as => 'v1' do

    post "/login" => "auth#login"
    post "/logout" => "auth#logout"
		post '/requesterList' => 'schedules#show'
		post '/itemsList'     => 'items#show'
    post '/setItems'      => 'items#create'
    post '/updateItems'    => 'items#complete'
    post '/itemHistory'   => 'healthcare#show'

  end

end
