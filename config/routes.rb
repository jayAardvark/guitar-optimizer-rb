Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      # slug is primary param in routing
      resources :instruments, param: :slug
      resources :repairs
    end
  end

  # route all paths not pre-defined in api to index path for use with react router
  get '*path', to: 'pages#index' via: :all
end
