Got::Application.routes.draw do
  resources :games, except: [:index, :destroy] do
    resources :results, except: [:index]
  end

  resources :players, only: [:index, :show]

  root 'games#index'
end
