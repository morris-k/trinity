class MainController < ApplicationController

	def index
		@quotes = Bquote.where(:section => "home")
	end

end
