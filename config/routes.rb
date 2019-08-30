Rails.application.routes.draw do
  devise_for :users
  get 'instruments/search', to: "instruments#search", as: :filtered_instruments
  root to: 'instruments#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :user do
  #   resources :instruments, only: [:new, :create, :edit, :update]
  # end
  resources :instruments, except: :index do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: :create
    collection do
      get :mine
    end
  end

  resources :categories, only: [:index]
  get 'instruments/categories/:id', to: 'categories#show', as: :category

  get 'bookings', to: "bookings#index", as: :my_bookings
  get 'bookings/:id/edit', to: "bookings#edit", as: :edit_booking
  patch 'bookings/:id', to: "bookings#update", as: :update_booking
end
