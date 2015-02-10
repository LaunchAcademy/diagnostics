Rails.application.routes.draw do
  resources :quizzes, only: [:show, :index]

  resources :questions, only: [:new, :create, :show, :index] do
    resources :answers, only: [:new, :create]
  end

  resources :answer_submissions, only: [:create]

  get "/auth/:provider/callback" => "sessions#create"
  get "/auth/failure" => "sessions#create"
  get "/sign_out" => 'sessions#destroy', as: :sign_out

  root "home#show"
end
