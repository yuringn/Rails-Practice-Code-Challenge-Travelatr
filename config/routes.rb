Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:new, :create, :show]
  resources :destinations, only: [:show]
  resources :posts, only: [:show, :new, :create, :edit, :update]
  patch '/posts/:id/add_like', to: 'posts#add_like', as: 'add_like'
end
