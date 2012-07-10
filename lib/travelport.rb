require "travelport/version"
require "travelport/model"
require "travelport/bridge"
require "travelport/config"
require "travelport/response"
require "travelport/request"
require "travelport/exceptions"

module Travelport
	def Travelport.config
		@config ||= Travelport::Config.new
	end
end
