Rails.application.routes.draw do
  get '/', to: redirect(path: '/cargos/new')
  resources :cargos, only: [:new, :create, :index, :show]
  resources :cities, only: [:index]
end
