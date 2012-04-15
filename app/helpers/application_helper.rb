module ApplicationHelper
	def title(page_title)
		base_title = "The Gift Giving Thread"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
