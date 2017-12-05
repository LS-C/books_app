Rails.application.routes.draw do
  devise_for :publishing_companies, path: 'publishing_companies'
  devise_for :authors, path: 'authors'

  resources :books


  resources :authors do
    resources :books, only: [:show]
  end
  resources :publishing_companies, only: [:index, :show, :create]



    root to: 'home#index'


    get 'books/:id/book_data', to: 'books#book_data'
    get 'authors/:id/book_data', to: 'authors#book_data'

    post '/book/:id/interest' => 'books#interest', as: :interest





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
