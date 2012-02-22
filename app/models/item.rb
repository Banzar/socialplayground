class Item < ActiveRecord::Base
	belongs_to :user
	validates_presence_of :item, :description, :state

	has_attached_file :photo,
	:styles => { :large => "220x" }, 
	:default_url => 'images/shirt.png',
  :storage => :s3,
  :bucket => ENV['S3_BUCKET2'],
  :s3_credentials => {
    :access_key_id => ENV['S3_KEY'],
    :secret_access_key => ENV['S3_SECRET']
  }
end
