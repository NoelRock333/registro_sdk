Rails.application.routes.draw do
  #resource :assistants_export, only: [:show]

  get 'assistants_export', to: 'assistants_export#show'

  resources :assistants do
    member do 
      put :mark
    end
  end
  
  resources :imports, only: [:new, :create]


  root 'assistants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
