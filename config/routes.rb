Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :caregivers
  resources :requesters do 
    resources :medications, controllers: "requester_medications"
  end 
  resources :schedules 
  get 'schedules/:requester_id/:date', :to => 'schedules#recent_days', :as => "schedules/recent_days"
  resources :health_records
  resources :comments

  root "welcomes#index"

  get 'roles', :to => 'roles#index'

  scope :path => '/api/v1/', :module => "api_v1", :defaults => { :format => :json }, :as => 'v1' do

    post "/login" => "auth#login"
    post "/logout" => "auth#logout"
		post '/requesterList' => 'schedules#show'
		post '/itemsList'     => 'items#show'
    post '/setItems'      => 'items#create'
    post '/updateItem'   => 'items#complete'
    post '/itemHistory'   => 'healthrecords#seven_day_records'

  end

end
