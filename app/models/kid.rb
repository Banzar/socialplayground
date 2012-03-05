class Kid < ActiveRecord::Base
	has_attached_file :photo, 
	:styles => { :small => "180x", :thumb => "50x50!" }, 
	:default_url => 'images/nopic.gif',
  	:storage => :s3,
  	:bucket => ENV['S3_BUCKET3'],
  	:s3_credentials => {
    	:access_key_id => ENV['S3_KEY'],
    	:secret_access_key => ENV['S3_SECRET']
  }

	belongs_to :user
end
