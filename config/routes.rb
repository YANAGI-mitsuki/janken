Rails.application.routes.draw do
  get 'game/start'
  get 'game/result'
  get 'top/index'
  root to: 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
