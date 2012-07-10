module Travelport::Response
	class Base
		
		attr_writer :raw_content

		def initialize(raw_content)
			self.raw_content = @raw_content
		end
	end
end
