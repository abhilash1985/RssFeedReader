# Routes
Rails.application.routes.draw do
  get 'articles/list'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'data_feeds#index'

  resources :data_feeds do
    member do
      resources :articles, only: [:index, :show]
    end
  end
end
