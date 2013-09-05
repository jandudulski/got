Got::Application.routes.draw do
  resources :game_versions, only: [:index]
  resources :games, except: [:destroy] do
    resources :results, except: [:index]
  end

  resources :players, only: [:index, :show]

  root 'pages#init'
end
