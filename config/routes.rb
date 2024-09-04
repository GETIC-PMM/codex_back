# frozen_string_literal: true

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" if defined?(Sidekiq)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :tags
        resources :treinamentos
        resources :categorias
      end

      resources :treinamentos, only: %i[index show] do
        collection do
          get :destaque_home
        end
      end
      resources :autores, only: %i[index show]
      resources :categorias, only: %i[index show]
      resources :tags, only: %i[index show]
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
