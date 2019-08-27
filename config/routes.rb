Rails.application.routes.draw do
  devise_for :users
  get 'instruments/search', to: "instruments#search", as: :filtered_instruments
  root to: 'instruments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :user do
  #   resources :instruments, only: [:new, :create, :edit, :update]
  # end
  resources :instruments, except: :index
end
