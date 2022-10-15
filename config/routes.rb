Rails.application.routes.draw do
  
  root to: 'main#index'

  namespace :manager do
    resources :specialties
    resources :doctors
    resources :patients
    # resources :receptions
    # resources :recommendations

    root to: "doctors#index"
  end
  devise_for :patients
  devise_for :admins, only: :sessions
  devise_for :doctors, only: :sessions
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
