module ApplicationHelper

	def admin_signed_in?(user)
		if (!user.nil? && user.admin?) 
			true
		else
			false
		end
	end

	def title(page_title)
	  content_for(:title) { page_title }
	end
end
