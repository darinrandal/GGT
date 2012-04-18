class Event < ActiveRecord::Base
	attr_accessible :event_type, :user_id1, :user_id2, :post_id
end
