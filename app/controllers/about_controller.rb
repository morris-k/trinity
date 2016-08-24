class AboutController < ApplicationController

	def purpose
		@vision = Bquote.find_by(section: "vision");
		@simple = Bquote.find_by(section: "simple_terms");
	end

	def pastor
	end
end
