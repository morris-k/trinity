module ApplicationHelper

	def title(page_title)
	  content_for(:title) { page_title }
	end

	def is_admin(user)
		user.admin?
	end
end
