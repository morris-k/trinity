class Event < ActiveRecord::Base

	validates_presence_of :title, :message => "Events must have a title."
	# validates_presence_of :start_time, :message => "Events must have a start time."

	attr_accessor :recurring_rules

	def current_existing_rule
		IceCube::Rule.monthly.day_of_month(-1).to_hash
	end

	def current_custom_rule
		IceCube::Rule.daily(2).to_hash
	end


end
