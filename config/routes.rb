Rails.application.routes.draw do

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

  resources :books do
    patch '/borrow', action: :borrow
    patch '/return', action: :return
  end

  resources :logs
end
