Rails.application.routes.draw do
  root 'chats#index'

  resources :chatrooms, only: [:index]
end
