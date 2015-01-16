Rails.application.routes.draw do
  resources :questions, only: [:new, :create] do
    resources :answers, only: [:new, :create]
  end
end
