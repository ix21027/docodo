Rails.application.routes.draw do
  
  get 'doctors/index'
  get 'specialties/index'
  resources :receptions
  resources :recommendations
  root to: 'main#index'

  namespace :manager do
    resources :specialties
    resources :doctors
    resources :patients
    resources :receptions
    resources :recommendations

    root to: "doctors#index"
  end

  resources :patient_profile, only: :index
  resources :doctor_profile, only: :index

  devise_for :patients
  devise_for :admins, only: :sessions
  devise_for :doctors, only: :sessions
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
