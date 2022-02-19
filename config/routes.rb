Rails.application.routes.draw do
  devise_for :users

  resources :questionnaires do
    resources :questions do
      resources :answers
    end
  end

  root "questionnaires#index"
end
