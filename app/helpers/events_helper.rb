module EventsHelper
	def dispatch_event(event)
		event_name = event_by_name(event.event_type)
		send("event_#{event_name}", event)
	end

	def event_log(event_type = 0, user_id1 = 0, user_id2 = 0, post_id = 0)
		@event = Event.new(:event_type => event_type, :user_id1 => user_id1, :user_id2 => user_id2, :post_id => post_id)
		@event.save
	end

private
	def event_by_name(id)
		#####[ unknown = 0, register = 1, permaban = 2, unban = 3, trash = 4, untrash = 5, usermod = 6, edit = 7 ]#####
		events = ['unknown', 'register', 'permaban', 'unban', 'trash', 'untrash', 'usermod', 'edit']
		events[id]
	end

	def pull_user(user_id)
		@users = User.all unless defined? @users
		@users[(user_id)-1]
	end

	def ago(event)
		time_ago_in_words(event.created_at) + ' ago'
	end

	def link_to_post(text, event)
		link_to(text, :controller => 'posts', :action => 'show', :id => event.post_id)
	end

	def link_to_user(user)
		t_user = pull_user(user)
		link_to(t_user.username, t_user)
	end

	def event_unknown(event)
		'An unknown event occured ' + ago(event)
	end

	def event_register(event)
		link_to_user(event.user_id1) + ' registered ' + ago(event)
	end

	def event_permaban(event)
		link_to_user(event.user_id1) + ' permabanned ' + link_to_user(event.user_id2) + ' for ' + link_to_post('this post', event) + ' ' + ago(event)
	end

	def event_unban(event)
		link_to_user(event.user_id1) + ' unbanned ' + link_to_user(event.user_id2) + ' ' + ago(event)
	end

	def event_trash(event)
		link_to_user(event.user_id1) + ' trashed ' + link_to_user(event.user_id2) + '\'s ' + link_to_post('post', event) + ' ' + ago(event)
	end

	def event_untrash(event)
		link_to_user(event.user_id1) + ' untrashed ' + link_to_user(event.user_id2) + '\'s ' + link_to('post', event) + ' ' + ago(event)
	end

	def event_usermod(event)
		link_to_user(event.user_id1) + ' modified ' + link_to_user(event.user_id2) + '\'s account information ' + ago(event)
	end

	def event_edit(event)
		link_to_user(event.user_id1) + ' edited ' + link_to_user(event.user_id2) + '\'s post ' + link_to_post('here', event) + ' ' + ago(event)
	end
end
