Rails.application.routes.draw do
  #users
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :show, :update, :destroy]
      get "/fetch", to: "endpoints#fetchUrl"
      post "/uploadImage", to: "endpoints#uploadImage"
      post "/uploadImageByUrl", to: "endpoints#uploadImageByUrl"
    end
  end
  
  
  resource :session, only: [:create, :destroy]
  resources :blocks, only: [:index, :create, :show, :update, :destroy]  
  resources :pages, only: [:create, :index, :show, :update, :destroy] do
    resources :blocks, only: [:index]
  end


end
