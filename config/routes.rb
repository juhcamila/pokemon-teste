Rails.application.routes.draw do
  root to: "treinadors#index"
  resources :time_treinadors do
    get '/pokemons/buscar/', to: 'pokemons#buscar'
    get '/pokemons/adicionar', to: 'pokemons#adicionar'
    resources :pokemons, only: [:destroy]
  end

  resources :treinadors

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
