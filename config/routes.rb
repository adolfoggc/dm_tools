Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  
  
  authenticate :user do
    root 'dashboard#home'
  end
  
  authenticated :user do
    resources :armors
    resources :monsters
    resources :weapons
    resources :proprieties
    resources :settlements
    resources :taverns
    devise_for :users
    
    get '/', to: 'dashboard#home', as: 'auth_home'

    get '/encounter_calculator', to: 'dashboard#encounter_calculator', as: 'encounter_calculator'
  end

end
