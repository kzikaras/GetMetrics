Rails.application.routes.draw do
  resources :registered_applications
  # post 'registered_applications_controller/create'

  # get 'registered_applications_controller/show'

  # get 'registered_applications_controller/update'

  # delete 'registered_applications_controller/destroy'

  # get 'registered_applications_controller/new'

  # get 'registered_applications_controller/index'

  namespace :api, defaults: {format: :json} do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end


  devise_for :users
  get 'welcome/index'

  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
              # #2
    resources :events, only: [:create]
  end
end
