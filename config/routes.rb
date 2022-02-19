Rails.application.routes.draw do
  resources :questionnaires do
    resources :questions do
      resources :answers
    end
  end

  root "questionnaires#index"
end
