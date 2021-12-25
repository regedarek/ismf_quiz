Rails.application.routes.draw do
  resources :questions
  resources :questionnaires

  root "questionnaires#index"
end
