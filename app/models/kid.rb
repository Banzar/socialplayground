class Kid < ActiveRecord::Base
	has_attached_file :photo, 
	:styles => { :small => "100x113!", :thumb => "50x50!" }, 
	:default_url => 'images/childprofile.gif',
  	:storage => :s3,
  	:bucket => ENV['S3_BUCKET3'],
  	:s3_credentials => {
    	:access_key_id => ENV['S3_KEY'],
    	:secret_access_key => ENV['S3_SECRET']
  }

	belongs_to :user
end
