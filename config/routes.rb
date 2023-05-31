Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#welcome"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/home", to: "pages#home", as: :home
  resources :users do
    resources :characters
  end

  resources :characters do
    resources :maps, only: %i[index new create] do
      collection do
        get :show_village, :show_cave, :show_castle, :show_ruin
        resources :monsters, only: %i[show index] do
          resources :questions do
            get :show_battle, on: :collection
          end
        end
      end
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
