module CalendarHelper

	def ampm_time(time)
		time.strftime("%l:%M %p")
	end
end
