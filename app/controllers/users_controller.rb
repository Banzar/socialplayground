class UsersController < ApplicationController
	def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
	  if @user.save
			session[:user_id] = @user.id
			#UserMailer.registration_confirmation(@user).deliver
			redirect_to get_info_url
	  else
	    render "new"
	  end
  end

	def index
		@users = User.all(:order => ["state"])
	end
	
  def home
    if current_user
      @user = current_user
			@feeds = Feed.all(:order => 'created_at desc', :limit => 8)
			@last_feed = current_user.feeds.last
			@events = Event.all
    else
      redirect_to sign_up_url
    end
  end

	def show
		if current_user
			@user = User.find_by_username(params[:username])
			@friend = @user.friends.each
			@friends = @friend.include?(@user)
		else
			redirect_to sign_up_url
		end
	end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to get_info_url, :notice => 'Information was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
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

	def feeds
    if current_user
      @user = current_user
			@feeds = Feed.all
			@last_feed = current_user.feeds.last
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

	def account
		if current_user
			@user = current_user
		else
			redirect_to log_in_url
		end
	end

	def events
		if current_user
			@user = current_user
		else
			redirect_to sign_up_url
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

	def items
		if current_user
			@items = current_user.items.all
		else
			redirect_to log_in_url
		end
	end

	def usersitems
		@user = current_user
		@item = Item.find(params[:id])
	end

	def all_listings
		@items = Item.all(:order => ["state"])
	end
end
