Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :characters
  end

  resources :characters do
    resources :maps, only: %i[index show new create] do
      get :show_village, on: :collection
    end
    resources :character_answers
    resources :questions do
      get :show_battle, on: :collection
    end
  end

  resources :maps do
    collection do
      resources :monsters, only: %i[show index]
    end
  end

  resources :monsters do
    resources :questions, only: %i[show new create]
    # resources :character_answers, only: :show

  end

  resources :questions do
    resources :answers, only: %i[index show new create]
    resources :character_answers, only: %i[index]
    get :show_battle, on: :collection
  end

  resources :characters do
    resources :questions do
      resources :answers do
        resources :character_answers, only: %i[new create] do
          get :result, on: :collection
        end
      end
    end
  end

  # resources :answers, only: %i[index show new create] do
  #   resources :character_answers, only: %i[index create]
  # end
end
