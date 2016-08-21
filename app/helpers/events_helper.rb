module EventsHelper

	def date_format(event)
		event.date.strftime("%B %-d, %Y")
	end
end
