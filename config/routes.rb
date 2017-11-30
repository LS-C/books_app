Rails.application.routes.draw do
  devise_for :publishing_companies, path: 'publishing_companies'
  devise_for :authors, path: 'authors'

  # resources :publishing_companies
  # resources :books
  resources :authors  do
    resources :books
  end

  resources :books
  root to: 'home#index'





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
