Rails.application.routes.draw do
  get 'current_user/index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do

      get 'customers/index'
      post 'customers/create'
      delete 'customers/:id', to: 'customers#destroy'
      post 'customer/upload_csv', to: 'customers#import_csv'

      get 'sleeps/index', to: 'user_sleep#index'
      post 'sleeps/sleep_in', to: 'user_sleep#sleep_in'
      post 'sleeps/:id/wake_up', to: 'user_sleep#wake_up'
      delete 'sleeps/:id/delete', to: 'user_sleep#destroy'
    end
  end

  root 'customers#index'
  get '/current_user', to: 'current_user#index'
  get '/users/list', to: 'current_user#list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
