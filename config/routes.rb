Rails.application.routes.draw do
  
  devise_for :users

  root 'posts#index'

  
  get 'batepapo/index'

  get 'profiles/show'
  
  get "adotar", to: 'posts#index', as: :adotar

  get "posts", to: 'posts#index'

  get '/:id', to: 'profiles#show', as: :id


  devise_scope :user do 
    get "cadastrar", to: "devise/registrations#new", as: :cadastrar
  end

  devise_scope :user do 
    get "entrar", to: "devise/sessions#new", as: :entrar
  end

  devise_scope :user do 
    get "sair", to: "devise/sessions#destroy", as: :sair
  end

  resources :posts

  resources :conversations do
    resources :messages
  end

end
