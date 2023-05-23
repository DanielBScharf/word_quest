Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :characters
  end

  resources :characters do
    resources :maps, only: %i[show new create]
  end

  resources :maps do
    resources :monsters, only: :show
    get :show_village, on: :collection
  end

  resources :monsters do
    resources :questions, only: %i[show new create]
  end

  resources :questions do
    resources :answers, only: %i[index show new create]
    resources :character_answers, only: %i[index show new create]
  end

  resources :answers, only: %i[index show new create] do
    resources :character_answers, only: %i[index show new create]
  end

end
