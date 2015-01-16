Rails.application.routes.draw do
  resources :questions, only: [:new, :create]
  resources :answers, only: [:new, :create]
end
