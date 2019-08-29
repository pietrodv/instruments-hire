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
    collection do
      get :mine
    end
  end

  get 'users/bookings', to: "bookings#index", as: :my_bookings
end
