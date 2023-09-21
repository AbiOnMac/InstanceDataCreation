Rails.application.routes.draw do
  resources :vacancies
  resources :jobseekers
  get 'chatgpt/chat_request'
  get 'welcome/index'
  root 'welcome#index'
  resources :generator, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
