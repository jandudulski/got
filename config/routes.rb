Got::Application.routes.draw do
  resources :games, except: [:index, :destroy] do
    resources :results, except: [:index]
  end

  root 'games#index'
end
