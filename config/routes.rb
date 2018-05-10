Rails.application.routes.draw do
  resources :assistants
  resources :imports, only: [:new, :create]

  root 'assistants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
