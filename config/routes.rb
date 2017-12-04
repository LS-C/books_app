Rails.application.routes.draw do
  devise_for :publishing_companies, path: 'publishing_companies'
  devise_for :authors, path: 'authors'

  resources :books



  resources :authors
  resources :publishing_companies







    root to: 'home#index'


    get 'books/:id/book_data', to: 'books#book_data'
    get 'authors/:id/book_data', to: 'authors#book_data'
    post '/interests', to: 'interests#create', as: :interests
    get '/interests', to: 'interests#index'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
