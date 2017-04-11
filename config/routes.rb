Rails.application.routes.draw do
  resources :marks
  resources :discipline_sections
  resources :community_disciplines
  get 'students_api/load_from_json_file', as: :load_from_json_file_students_api
  post 'students_api/load_from_json_file'

  get 'disciplines_api/load_from_json_file', as: :load_from_json_file_disciplines_api
  post 'disciplines_api/load_from_json_file'

  get 'groups_api/load_from_json_file', as: :load_from_json_file_groups_api
  post 'groups_api/load_from_json_file'

  get 'welcome/index', as: :index
  get 'welcome/insufficient_privileges', as: :ip

  resources :message_users
  resources :messages do
    member do
      get :show_file, as: :show_file
    end
  end
  resources :study_files
  resources :notices
  resources :institution_users
  resources :institutions
  resources :message_lists
  resources :community_contents
  resources :community_tabs
  resources :community_sections
  resources :community_users
  resources :communities
  resources :disciplines
  resources :ranking_algorithms
  resources :groups
  resources :role_users
  resources :roles
  resources :terms
  root :to => 'welcome#index'
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
