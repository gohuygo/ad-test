Rails.application.routes.draw do
  devise_for :users
  root 'welcome#show'

  resources :billboards, only: [:index, :update]
end
