Got::Application.routes.draw do
  resources :game_versions, only: [:index]
  resources :games, only: [:index, :new, :create, :update, :edit] do
    resources :results, except: [:index]
  end
  resources :houses, only: [:index]
  resources :players, only: [:index, :show]

  root 'pages#init'
end
