Rails.application.routes.draw do
  get '/', to: 'redirects#new'
  get '/:id', to: 'redirects#show'
  resources :redirects, only: [:show, :new, :create]
  resources :visits
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
