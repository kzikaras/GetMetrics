Rails.application.routes.draw do
  resources :registered_applications
  # post 'registered_applications_controller/create'

  # get 'registered_applications_controller/show'

  # get 'registered_applications_controller/update'

  # delete 'registered_applications_controller/destroy'

  # get 'registered_applications_controller/new'

  # get 'registered_applications_controller/index'

  devise_for :users
  get 'welcome/index'

  root "welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
