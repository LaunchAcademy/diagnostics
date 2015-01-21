Rails.application.routes.draw do
  resources :questions, only: [:new, :create] do
    resources :answers, only: [:new, :create]
  end

  get "/auth/:provider/callback" => "sessions#create"
  get '/sign_out' => 'sessions#destroy', as: :sign_out

  root "home#show"
end
