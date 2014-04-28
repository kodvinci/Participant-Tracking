ParticipantTracking::Application.routes.draw do
 
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :participants, only: [:index, :create]
      resources :properties, only: [:index]
      resources :participant_properties, only: [:index, :create]
      resources :participant_types, only: [:index]
    end
  end 
   
  root 'participants#index'
  resources :properties 
  resources :participant_types
  resources :participants do
      resources :participant_properties 
  end

end
