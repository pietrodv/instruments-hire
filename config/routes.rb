Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user do
    resources :instruments, only: [:new, :create, :edit, :update]
  end

  resources :instruments, only: [:index, :show, :destroy]
end
