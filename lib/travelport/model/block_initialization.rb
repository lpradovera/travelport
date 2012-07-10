require 'active_support/concern'
module Travelport::Model::BlockInitialization
	extend ActiveSupport::Concern

	def initialize(*)
		super
		yield self if block_given?
	end

end