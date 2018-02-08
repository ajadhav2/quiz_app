Rails.application.routes.draw do
  get 'answer_trivia', to: 'answer_trivia#index'
  post 'answer_trivia/get_score'

  resources :categories
  resources :trivia do
    collection do
      get 'highscore'
    end
  end
  devise_for :users
  root 'homes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
