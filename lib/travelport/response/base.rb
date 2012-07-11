module Travelport::Response
  class Base

    def initialize(raw_content)
      @raw_content = raw_content
      process unless @raw_content.nil?
    end
  end
end
