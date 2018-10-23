Rails.application.routes.draw do
  resources :users do
  	resources :templates
    resources :sent_emails
  end
  get "/send_emails", :to => "templates#get_emails"
  post "/send_emails", :to => "templates#send_emails"
  resources :template_properties
  resources :properties
  post "/templates", :to => "templates#create"
  post "/register", :to => "registrations#new"
  post "/login", :to => "registrations#login"
  post "/add-manual-follow-up", :to => "application#add_manual_follow_up"
  get "/manual-follow-ups", :to => "application#manual_follow_ups"
  post "/remove-manual-follow-up", :to => "application#remove_manual_follow_up"
  post "/add-manual-follow-up-domain", :to => "application#add_manual_follow_up_domain"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
