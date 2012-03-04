Abby::Application.routes.draw do
	get "messages/show"

	get "sent/show"
	get "reply_message/:id", :controller => "messages", :action => "reply"
	get "sent_mail" => "sent#index", :as => "sent_mail"
	get "send" => "sent#new", :as => "send"
	get "mymail", :controller => "mailbox", :action => "index"
	get "listings" => "users#all_listings", :as => "listings"
  get "my_items" => "users#items", :as => "my_items"
	get "events" => "users#events", :as => "events"
  get "users" => "users#index", :as => "users"
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
	get "/users/:id/friends", :controller => "users", :action => "user_friends", :as => "user_friends"

  	root :to => "users#home"

	resources :sent
	resources :messages
	resources :reply_message
	resources :mailbox
	resources :items
 	resources :users
	resources :sessions
	resources :events
	resources :feeds
	resources :friendships
	resources :friends

end
