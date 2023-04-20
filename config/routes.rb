Rails.application.routes.draw do
  resources :armors
  resources :combat_equipments
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  
  
  authenticate :user do
    root 'dashboard#home'
  end
  
  authenticated :user do
    resources :monsters

    get '/', to: 'dashboard#home', as: 'auth_home'

    get '/encounter_calculator', to: 'dashboard#encounter_calculator', as: 'encounter_calculator'
  end

end
