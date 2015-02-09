Rails.application.routes.draw do
  namespace :admin do
    resources :questions, only: [:new, :create, :index]
  end

  resources :quizzes, only: [:show] do
    resources :questions, only: [:index]
  end

  resources :questions, only: [:show] do
    resources :answers, only: [:new, :create]
  end

  resources :answer_submissions, only: [:create]

  get "/auth/:provider/callback" => "sessions#create"
  get "/auth/failure" => "sessions#create"
  get "/sign_out" => 'sessions#destroy', as: :sign_out

  root "home#show"
end
