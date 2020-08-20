Rails.application.routes.draw do
 ユーザー管理機能
  devise_for :users
  root to: 'items#index'
  resources :tweets
end
