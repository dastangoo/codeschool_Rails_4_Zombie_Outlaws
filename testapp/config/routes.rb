Rails.application.routes.draw do
  resources :people
  resources :users
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # match '/items/:id/purchase', to: 'items#purchase'
  
  # post '/items/:id/purchase', to: 'items#purchase'
  
  # match '/items/:id/purchase', to: 'items#purchase', via: :post
  
  match '/items/:id/purchase', to: 'items#purchase', via: :all
end
