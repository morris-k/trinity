class LocationController < ApplicationController

	def show
		@address = "1819 North 16th Street,Orange,TX"
		@latlon = "S%7C30.109435,-93.748006"
		@key = API_MAPS
	end
end
