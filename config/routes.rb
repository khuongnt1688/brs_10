Rails.application.routes.draw do
  devise_for :users
  root  'static_pages#home'
  
  get   'help'    => 'static_pages#help'
  get   'about'   => 'static_pages#about'
  get   'contact' => 'static_pages#contact'

  resources :users
  resources :categories do
    resources :books
  end
  resources :books do
    resources :reviews
    resources :book_states
  end
  resources :reviews do
    resources :comments
  end

  namespace :admin do
    root 'static_pages#home'
    resources :users
  end
end