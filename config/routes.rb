Abby::Application.routes.draw do
	get "posts" => "posts#index", :as => "posts"
	get "post/:id", :controller => "posts", :action => "show"
  get "/activity/:id", :controller => "activities", :action => "show"
  get "family_fun" => "activities#index", :as => "family_fun"
	get "new_activity" => "activities#new", :as => "new_activity"
  get "my_kids" => "kids#new", :as => "my_kids"
	get "reply_message/:id", :controller => "messages", :action => "reply"
	get "sent_mail" => "sent#index", :as => "sent_mail"
	get "send" => "sent#new", :as => "send"
	get "mymail", :controller => "mailbox", :action => "index"
	get "/sent/new?to=:username", :controller => "sent", :action => "new"
	get "listings" => "users#all_listings", :as => "listings"
  get "my_items" => "users#items", :as => "my_items"
	get "events" => "users#events", :as => "events"
  get "users" => "users#index", :as => "users"
  get "get_info" => "users#get_info", :as => "get_info"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  get "feeds" => "users#feeds", :as => "feeds"
	get "friends" => "users#friends", :as => "friends"
	get "/:username", :controller => "users", :action => "show"
	get "/:username/friends", :controller => "users", :action => "usersfriends"
	get "/event/:id", :controller => "users", :action => "usersevents"
	get "/item/:id", :controller => "users", :action => "usersitems"
	get "/users/:id/friends", :controller => "users", :action => "user_friends", :as => "user_friends"
	get "/kids/:id", :controller => "kids", :action => "my_kid"

  root :to => "users#home"

	resources :posts do resources :comments end
	resources :activities
	resources :kids
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
