class User < ActiveRecord::Base
	has_attached_file :avatar, 
	:styles => { :small => "180x", :thumb => "50x50!" }, 
	:default_url => 'images/nopic.gif',
  :storage => :s3,
  :bucket => ENV['S3_BUCKET'],
  :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET']
  }

	attr_accessible :email, :password, :password_confirmation, :first_name, 
:last_name, :birthday, :county, :state, :zip_code, :about_us, :username, 
:avatar
  
	
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username
	validates_format_of :email,
 :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i

	has_many :events, :dependent => :destroy
	has_many :feeds, :dependent => :destroy
	has_many :items, :dependent => :destroy
	has_many :friendships, :dependent => :destroy
	has_many :friends, :through => :friendships, :conditions => "status = 'accepted'"
	has_many :requested_friends, :through => :friendships, :source => :friend, :conditions => "status = 'requested'", :order => "friendships.created_at"
	has_many :pending_friends, :through => :friendships, :source => :friend, :conditions => "status = 'pending'", :order => "friendships.created_at"


	def add_friend(friend)
		friendship = friendships.create(:friend_id => friend.id)
		if !friendship.save
			logger.debug "User '#{friend.email}' already exists in your friendships list."
		end
	end

	def some_feeds
		Feed.find(:all, :conditions => ["user_id in (?)", friendships.map(&:id).push(self.id)], :order => "created_at desc", :limit => 8)
	end

	def all_feeds
		Feed.find(:all, :conditions => ["user_id in (?)", friends.map(&:id).push(self.id)], :order => "created_at desc")
	end

	def some_events
		Event.find(:all, :conditions => ["user_id in (?)", friends.map(&:id)], :order => "created_at desc", :limit => 10)
	end

  def self.authenticate(login, password)
    user = find_by_email(login) || find_by_username(login)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

	def login_required
		unless current_user
			redirect_to log_in_page
		end
	end

	def self.search(search)
		if search
			find(:all, :conditions => ['username LIKE ?', "%#{search}%"])
		else
			find(:all)
		end
	end								
end

