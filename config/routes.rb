Abby::Application.routes.draw do
	get "listings" => "users#all_listings", :as => "listings"
  get "my_items" => "users#items", :as => "my_items"
	get "events" => "users#events", :as => "events"
  get "users" => "users#index", :as => "users"
	get "account" => "users#account", :as => "account"
  get "get_info" => "users#get_info", :as => "get_info"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "feeds" => "users#feeds", :as => "feeds"
  get "profile" => "users#home", :as => "profile"
	get "friends" => "users#friends", :as => "friends"
	get "/:username", :controller => "users", :action => "show"
	get "/:username/friends", :controller => "users", :action => "usersfriends"
	get "/event/:id", :controller => "users", :action => "usersevents"
	get "/item/:id", :controller => "users", :action => "usersitems"
  root :to => "users#home"

	resources :items
  resources :users
  resources :sessions
	resources :events
	resources :feeds
	resources :friendships
	resources :friendship
end
