Rails.application.routes.draw do
  get '/', to: 'redirects#new'
  get '/:id', to: 'redirects#show'
  get '/:id/info', to: 'redirects#info'
  resources :redirects, only: [:show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
