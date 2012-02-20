class Event < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :event_name, :event_description, :created_at, 
												:start_time, :date
end
