Rails.application.routes.draw do
  resources :mine_sweeper_boards
  get '/recent_boards', to: 'mine_sweeper_boards#recent_boards'
  
  root 'mine_sweeper_boards#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
