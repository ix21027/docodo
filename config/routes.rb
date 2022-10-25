Rails.application.routes.draw do

  root to: 'main#index'

  namespace :manager do
    resources :specialties
    resources :doctors
    resources :patients

    root to: "doctors#index"
  end

  resources :specialties, only: :index
  resources :doctors, only: :index
  resources :patient_profile, only: :index
  resources :patients, only: :index
  resources :receptions
  resources :recommendations

  devise_for :patients
  devise_for :admins, only: :sessions
  devise_for :doctors, only: :sessions
  get '*path' => redirect('/')
end
