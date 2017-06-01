module EventsHelper

	def date_format(time)
		res = time.strftime("%B %-d, %Y")
	end

	def time_format(time)
		res = time.strftime("%I:%M %p")
		if res[0] == "0"
			res = res[1..-1]
		end
		res
	end


end
