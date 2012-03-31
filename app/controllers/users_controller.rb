class UsersController < ApplicationController

	def account
		if current_user
			@user = current_user
		else
			redirect_to log_in_url
		end
	end

	def all_listings
		@items = Item.all(:order => ["state"])
	end

  def create
    @user = User.new(params[:user])
	  if @user.save
			session[:user_id] = @user.id
			UserMailer.registration_confirmation(@user).deliver
			redirect_to get_info_url
	  else
	    render "new"
	  end
  end

	def destroy
		@user = User.find(params[:id])
		redirect_to log_out_url
		if @user.destroy
			session[:user_id] = nil
		end
	end

	def events
		if current_user
			@user = current_user
			@events = current_user.events.all
		else
			redirect_to sign_up_url
		end
	end

	def feeds
    if current_user
      @user = current_user
			@feeds = current_user.all_feeds
			@last_feed = current_user.feeds.last
    else
      redirect_to sign_up_url
    end
  end

	def friends
		if current_user
			@user = current_user
			@friends = current_user.friends.all
			@friendships = current_user.friendships
		else
			redirect_to sign_up_url
		end
	end
	
	def get_info
		if current_user
			@user = current_user
		else
			redirect_to log_in_url
		end
	end

  def home
    if current_user
      @user = current_user
			@feeds = current_user.some_feeds
			@last_feed = current_user.feeds.last
			@events = current_user.friend_events
    else
      redirect_to sign_up_url
    end
  end

	def index
		@all_users = User.all
		if params[:search] && !params[:search].empty?
			@users = User.find(:all, :conditions => ['first_name LIKE ?', "%#{params[:search]}%"]) + User.find(:all, :conditions => ['last_name LIKE ?', "%#{params[:search]}%"]) + User.find(:all, :conditions => ['username LIKE ?', "%#{params[:search]}%"]) + User.find(:all, :conditions => ['full_name LIKE ?', "%#{params[:search]}%"]) + User.find(:all, :conditions => ['county LIKE ?', "%#{params[:search]}%"]) + User.find(:all, :conditions => ['state LIKE ?', "%#{params[:search]}%"]) 
		else
			@users = User.paginate(:page => params[:page], :per_page => 10, :order => ["state"])
		end
	end

	def items
		if current_user
			@items = current_user.items.all
		else
			redirect_to log_in_url
		end
	end

	def new
  	@user = User.new
		@online = User.find(:all, :conditions => [ "zip_code = 2" ])
  end

	def show
		@user = User.find_by_username(params[:username])
		@friends = @user.friends.all
		@children = @user.kids.all
	end

  def update
    @user = User.find(params[:id])
		@user.full_name = ("#{@user.first_name} #{@user.last_name}")

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to root_url, :notice => 'Information was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

	def usersevents
		if current_user
			@user = current_user
			@event = Event.find(params[:id])
		else
			redirect_to sign_up_url
		end
	end

	def usersitems
		@user = current_user
		@item = Item.find(params[:id])
	end
end
