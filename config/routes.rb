# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  namespace :api do
    namespace :v1 do
      resources :parks, only: [:index, :show] do
        resources :activities, only: [:index, :show]
      end
      
      resources :activities, only: [:index, :show] do
        resources :bookings, only: [:create]
      end
      
      resources :bookings, only: [:show, :index]
      
      # Contact form endpoint
      post 'contact', to: 'contacts#create'
    end
  end
end