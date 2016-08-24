class AboutController < ApplicationController

	def purpose
		@vision = Bquote.find_by(section: "vision");
	end

	def pastor
	end
end
