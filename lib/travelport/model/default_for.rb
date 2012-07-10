require 'active_support/concern'
module Travelport::Model::DefaultFor
	extend ActiveSupport::Concern

	def initialize(*)
		self.class.defaults.each do |key, val|
			self.send("#{key}=", val)
		end
	end

	module ClassMethods

		attr_reader :defaults
		
		def default_for(attr_name, attr_value)
			@defaults ||= {}
			@defaults[attr_name] = attr_value
		end

	end
end