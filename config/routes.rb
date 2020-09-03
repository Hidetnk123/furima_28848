Rails.application.routes.draw do
  devise_for :users 
   root to: 'items#index'
   resources :users
   resources :items do
     resources :purchase_histories
   end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end