Rails.application.routes.draw do
  devise_for :users
  get 'instruments/search', to: "instruments#search", as: :filtered_instruments
  root to: 'instruments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :user do
  #   resources :instruments, only: [:new, :create, :edit, :update]
  # end
  resources :instruments, except: :index do
    resources :bookings, only: [:create]
    collection do
      get :mine
    end
  end
  resources :categories, only: [:index]
  get 'instruments/categories/:id', to: 'categories#show', as: :category
end
