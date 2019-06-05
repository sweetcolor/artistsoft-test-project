Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/load_users', to: 'user#load_users'
  root to: 'user#index'
end
