Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      get 'customers/index'
      post 'customers/create'
      delete 'customers/:id', to: 'customers#destroy'
      post 'customer/upload_csv', to: 'customers#import_csv'
    end
  end

  root 'customers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
