VulnerableApp::Application.routes.draw do
  resources :posts

  resources :users, only: :create
  resources :sessions, only: :create
end
