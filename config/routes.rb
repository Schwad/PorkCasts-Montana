Rails.application.routes.draw do


  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # root "static_pages#alternative"
  namespace :v1 do
    get "static_pages/index", :as => 'index'
    get "static_pages/about", :as => 'about_page'
    get "static_pages/denied", :as => 'denied_page'
    get "static_pages/news", :as => 'news_page'
    get "static_pages/tutorial", :as => 'tutorial_page'
    resources :users do
      resources :queries
    end
    get '/queries/:id', to: 'queries#show'
    resources :tags
    get '/search', to: 'searches#show'
    get '/private_search', to: 'searches#private_show'
    post '/search', to: 'searches#search'
    post '/private_search', to: 'searches#private_search'
  end

  root "static_pages#index"
  get "static_pages/about", :as => 'about_page'
  get "static_pages/denied", :as => 'denied_page'
  get "static_pages/tutorial", :as => 'tutorial_page'
  resources :users do
    resources :queries
  end
  get '/queries/:id', to: 'queries#show'
  resources :tags
  get '/search', to: 'searches#show'
  get '/private_search', to: 'searches#private_show'
  post '/search', to: 'searches#search'
  post '/private_search', to: 'searches#private_search'
  get '/autocomplete', to: 'searches#autocomplete'

end
