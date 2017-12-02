Rails.application.routes.draw do
  resources :interests
  devise_for :publishing_companies, path: 'publishing_companies'
  devise_for :authors, path: 'authors'

  # resources :publishing_companies

  resources :books
  resources :authors
  resources :publishing_companies







    root to: 'home#index'


    get 'books/:id/book_data', to: 'books#book_data'
    get 'authors/:id/book_data', to: 'authors#book_data'







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
