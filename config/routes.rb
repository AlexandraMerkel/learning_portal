Rails.application.routes.draw do
  resources :message_users
  resources :messages
  resources :study_files
  resources :notices
  resources :institution_users
  resources :institutions
  resources :message_lists
  resources :community_contents
  resources :marks
  resources :community_tabs
  resources :community_sections
  resources :community_users
  resources :communities
  resources :discipline_sections
  resources :disciplines
  resources :ranking_algorithms
  resources :groups
  resources :role_users
  resources :roles
  resources :terms
  root :to => 'users#index'
  resources :user_sessions
  resources :users do
    member do
      get :activate
    end
  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
