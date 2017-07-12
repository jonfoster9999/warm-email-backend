Rails.application.routes.draw do
  resources :users do 
  	resources :templates
  end
  resources :template_properties
  resources :properties
  post "/templates", :to => "templates#create"
  post "/register", :to => "registrations#new"
  post "/login", :to => "registrations#login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
