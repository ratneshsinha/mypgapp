Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'upload', to: 'icds#upload'
  get 'search', to: 'icds#search'

  resources :icds
end
