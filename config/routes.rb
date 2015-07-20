Rails.application.routes.draw do
  

  resources :posts


  devise_for :users

  resources :losts do
    resources :conversations
  end

   resources :profiles do
    resources :conversations
  end


  devise_scope :user do 
    get "cadastrar", to: "devise/registrations#new", as: :cadastrar
  end

  devise_scope :user do 
    get "entrar", to: "devise/sessions#new", as: :entrar
  end

  devise_scope :user do 
    get "sair", to: "devise/sessions#destroy", as: :sair
  end


  root 'posts#index'

  get 'profiles/show'
  
  get "adotar", to: 'posts#index', as: :adotar

  get "posts", to: 'posts#index'

  get "/pages/:page" => "pages#show"

  get '/:id', to: 'profiles#show', as: :id do
    resources :conversations
  end

  resources :conversations do
    resources :messages
  end

end
