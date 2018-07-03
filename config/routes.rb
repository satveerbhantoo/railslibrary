Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
  post 'auth_user' => 'authentication#authenticate_user'
  devise_scope :user do
    get "sign_up" => "devise/registrations#new" , as: "new_user_registration"
  end


  devise_for :users
  ActiveAdmin.routes(self)

  match "/admin/notify_users" => 'admin/dashboard#notify_users', via: :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
 
  root 'home#index'

  

  post 'books/search' => "books#search", as: "books_search"
  post 'books/create_comment' => "books#create_comment" , as: "comment_create"
  
  resources :comments

  resources :books do
    patch '/borrow', action: :borrow
    patch '/return', action: :return
    post '/comment', action: :comment
  end

  resources :logs

  #API Definition
  namespace :api do
    scope 'v1' do 
      
      scope 'books' do 
        
        get '/' => 'api_books#index'
        post '/create' => 'api_books#create'
        delete '/destroy' => 'api_books#destroy'
        scope '/:id' do
          get '/' => 'api_books#show'
        end
      end 
    end 
  end
end
