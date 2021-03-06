Rails.application.routes.draw do
  resources :posts do
    resources :comments , :only => [:create, :destroy]
  end
  root 'posts#index'
  
  get 'pages/about'
  get 'pages/contact'
  
  match '/contacts',  to: 'contacts#new',   via: 'get'
  resources "contacts", only: [:new, :create]
 
end
